unit DVIW_regp;
{$N+}
interface

function TMultiplier (N : double) : double;
function Epsilon(Age: double; J : byte): double;
function EpsilonGamma(Age: double; J : byte; IAnalTyp : integer): double;
function EpError(Age : double; I : byte) : double;
function EpGammaError(Age : double; I : byte; IAnaltyp : integer) : double;
function DM_Age(tx, ty, DM1, DM2, DM3, DecayConst : double) : double;
function DM_Age_Error(X, Xerr, Y, Yerr, T_Mult, DM1, DM2, DM3, DecayConst : double) : double;
procedure WtAver ( NS                : integer;
                  var WtAver, MSWD,
                      WESDoM, WOSDoM : double;
                  var N              : integer);

implementation

uses
  ServerController, DVIW_constants;

function TMultiplier (N : double) : double;
{from Ludwig 1990 - ISOPLOT}
var
  W    : double;
  temp : double;
begin
  temp := 12.706;
  if N=1.0 then temp := 12.706;
  if N>1.0 then
  begin
    W := N-0.85;
    temp := 1.96 - 0.00554568/Sqrt(W)
                      + 2.4059333/W
                      + 0.6711777/(W*W)
                      - 0.3831214/(W*W*W);
  end;
  if N<1.0 then
  begin
    if (N > 0.0) then
    begin
      temp := 1.0/(  N * -0.00765
                      + (N*N) * 0.11085
                      - (N*N*N) * 0.02446);
    end else temp := 1.96;
  end;
  Result := Abs(temp);
end;


function Epsilon(Age: double; J : byte): double;
var
  T1, T2      :  double;
begin
  Epsilon := 0.0;
  {
  if (CHUR[IAnalTyp,2] > 0.0) then
  begin
    if (Age > 0.0) then
    begin
      T1:=Ratio[J,2]-Ratio[J,1]*(Exp(DecayConst[IAnalTyp]*Age*1.0E6)-1.0);
      T2:=CHUR[IAnalTyp,2]-CHUR[IAnalTyp,1]*(Exp(DecayConst[IAnalTyp]*Age*1.0E6)-1.0);
    end;
    if (Age <= 0.0) then
    begin
      if (Age < 0.0) then Age:=0.0;
      T1:=Ratio[J,2];
      T2:=CHUR[IAnalTyp,2];
    end;
    Epsilon:=10000.0*(T1/T2-1.0);
  end else
  begin
    Epsilon:=-9999.99;
  end;
  }
end;{function Epsilon}

function EpsilonGamma(Age: double; J : byte; IAnalTyp : integer): double;
var
  T1, T2      :  double;
begin
  EpsilonGamma := 0.0;
  {
  if (CHUR[IAnalTyp,2] > 0.0) then
  begin
    if (Age > 0.0) then
    begin
      T1:=Ratio[J,2]-Ratio[J,1]*(Exp(DecayConst[IAnalTyp]*Age*1.0E6)-1.0);
      T2:=CHUR[IAnalTyp,2]-CHUR[IAnalTyp,1]*(Exp(DecayConst[IAnalTyp]*Age*1.0E6)-1.0);
    end;
    if (Age <= 0.0) then
    begin
      if (Age < 0.0) then Age:=0.0;
      T1:=Ratio[J,2];
      T2:=CHUR[IAnalTyp,2];
    end;
    if (IAnalTyp = 15) then
    begin
      Result:=100.0*(T1/T2-1.0);
    end else
    begin
      Result:=10000.0*(T1/T2-1.0);
    end;
  end else
  begin
    Result:=-9999.99;
  end;
  }
end;{function EpsilonGamma}

function EpError(Age : double; I : byte) : double;
var
  t1 : double;
begin
  EpError := 1.0;
  {
  t1:=RoError(Age,I);
  if (t1<>9.999999) then EpError:=10000.0*t1/InitialRatio(Age,I)
                    else EpError:=99.999;
  }
end;

function EpGammaError(Age : double; I : byte; IAnaltyp : integer) : double;
var
  t1 : double;
begin
  EpGammaError := 1.0;
  {
  t1:=RoError(Age,I);
  if (t1<>9.999999) then Result:=10000.0*t1/InitialRatio(Age,I)
                    else Result:=99.999;
  if (IAnalTyp = 15) then Result := Result/100.0;
  }
end;

function DM_Age(tx, ty, DM1, DM2, DM3, DecayConst : double) : double;
var
  I            : integer;
  temp, temp1  : double;
  DMX1, DMY1, DMY2, Difference,
  AgeMax, ApproxAge
               :  double;
  ThisDone         :  Boolean;
begin
  AgeMax := 4.60e9;
  if (DM3 > 0.0) then
  begin
    if (DM1 <> 0.0) then
    begin
      ThisDone:=false;
      I:=0;
      AgeMax:=4.60E9;
      repeat
        DMX1:=ty-tx*(Exp(DecayConst*AgeMax)-1.0);
        DMY1:=DM1*(AgeMax)*(AgeMax) + DM2*(AgeMax) + DM3;
        DMY2:=DM2 + tx*DecayConst*(Exp(DecayConst*AgeMax));
        DMY2:=DMY2 + 2.0*DM1*AgeMax;
        DMY1:=DMY1-DMX1;
        if (DMY2 <> 0.0) then
          ApproxAge:=AgeMax-DMY1/DMY2
        else begin
          ApproxAge:=1.0e6;
          I:=51;
        end;
        Difference:=Abs(AgeMax-ApproxAge);
        AgeMax:=ApproxAge;
        I:=I+1;
        if Difference<AgeTolerance then ThisDone:=true;
        if I>50 then
        begin
          AgeMax:=-9999.990E6;
          ThisDone:=true;
        end;
      until ThisDone;
    end;
    if ((DM1 = 0.0) and (DM2 > 0.0)) then
    begin
      temp:=((ty-DM3)/(tx-DM2)+1.0);
      if (temp>0.0) then temp1:=Ln(temp)
                    else temp1:=0.0;
      AgeMax:=(temp1/DecayConst);
    end;
    DM_Age:=AgeMax/1.0E6;
  end else
  begin
    DM_Age := -9999.99;
  end;
end;


function DM_Age_Error(X, Xerr, Y, Yerr, T_Mult, DM1, DM2, DM3, DecayConst : double) : double;
var
  tage, tplus1,
  tminus1,
  t1, t2    : double;
begin
  t1 := Xerr;
  t2 := Yerr;
  if (t1<=0.0) then t1:=1.0e-5;
  if (t2<=0.0) then t2:=1.0e-5;
  tage:=DM_Age(X,Y,DM1,DM2,DM3,DecayConst);
  tplus1:=DM_Age(X+t1*T_Mult,Y+t2*T_Mult,DM1,DM2,DM3,DecayConst);
  tminus1:=DM_Age(X-t1*T_Mult,Y-t2*T_Mult,DM1,DM2,DM3,DecayConst);
  DM_Age_Error:=Sqrt(((tplus1-tage)*(tplus1-tage)+(tage-tminus1)*(tage-tminus1))+0.000001);
end;

procedure WtAver ( NS                : integer;
                  var WtAver, MSWD,
                      WESDoM, WOSDoM : double;
                  var N              : integer);
var
  i            : integer;
  W            : double;
  Sum : array[1..5] of double;
begin
  N:=0;
  Sum[1]:=0.0; Sum[2]:=0.0; Sum[3]:=0.0; Sum[4]:=0.0; Sum[5]:=0.0;
  if (NS > 1) then
  begin
    if (NS > MaxSamp) then NS := MaxSamp;
    for i:=1 to NS do
    begin
        N:=N+1;
        if (UserSession.Xtra1[i] <> 0.0) then W:=1.0/(UserSession.Xtra1[i]*UserSession.Xtra1[i])
                             else W:=1.0;
        Sum[1]:=Sum[1]+W;
        Sum[2]:=Sum[2]+W*UserSession.Xtra[i];
        Sum[3]:=Sum[3]+W*UserSession.Xtra[i]*UserSession.Xtra[i];
    end;
    if (N > 1) then
    begin
      WtAver:=Sum[2]/Sum[1];
      MSWD:=(Sum[3]-Sum[2]*Sum[2]/Sum[1])/(1.0*(N-1));
      if (Sum[1] > 0) then WESDoM:=1.0/Sqrt(Sum[1])
                      else WESDoM:=-9999.99;
      Sum[1]:=0.0; Sum[2]:=0.0; Sum[3]:=0.0; Sum[4]:=0.0; Sum[5]:=0.0;
      for i:=1 to NS do
      begin
          W:=1.0/(UserSession.Xtra1[i]*UserSession.Xtra1[i] + WESDoM*WESDoM);
          Sum[1]:=Sum[1]+W;
          Sum[2]:=Sum[2]+W*UserSession.Xtra[i];
          Sum[3]:=Sum[3]+W*UserSession.Xtra[i]*UserSession.Xtra[i];
          Sum[4]:=Sum[4]+W;
          Sum[5]:=Sum[5]+W*(UserSession.Xtra[i]-WtAver)*(UserSession.Xtra[i]-WtAver);
      end;
      MSWD:=(Sum[3]-Sum[2]*Sum[2]/Sum[1])/(1.0*(N-1));
      if (Sum[4] > 0) then WOSDoM:=Sqrt((Sum[5]/Sum[4])/(1.0*(N-1)))
                      else WOSDoM:=-9999.99;
    end
    else begin
      WESDoM:=0.0;
      WOSDoM:=0.0;
      WtAver:=0.0;
      MSWD:=0.0;
      if (N = 1) then
      begin
        for i:=1 to NS do
        begin
            WtAver := UserSession.Xtra[i];
            WESDom := UserSession.Xtra1[i];
            WOSDom := UserSession.Xtra1[i];
        end;
        MSWD := 0.0;
      end;
    end;
    {include Troutman option for MSWD > F}
  end else
  begin
    if (NS = 1) then
    begin
      WtAver := UserSession.Xtra[1];
      WOSDoM := UserSession.Xtra1[1];
      WESDom := UserSession.Xtra1[1];
      MSWD := 0.0;
      N := 1;
    end;
  end;
end;



end.


