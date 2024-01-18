unit DVIW_mathproc;

interface

function Tan( X : real) : real;
function Power(X,Y : double) : double;   { Y to power X }
function LogX(X:real) : real;
function ArcSin(X:real) : real;
function ArcCos(X:real) : real;
function Gauss (Ratio, Mean, Dev : real) : double;
function gammln (xx : double): double;
function betacf (a,b,x : double): double;
function ProbabilityOfF( nu1,nu2 : double; F : double; Tails : integer) : double;
function betai (a,b,x : double): double;


implementation

function Tan( X : real) : real;
var
  temp : double;
begin
  temp:=Sin(X)/Cos(X);
  Tan := temp;
end;

function Power(X,Y : double) : double;
{Y to POWER X}
var
  temp : double;
begin
 if Y>0.0 then temp:=Exp(X*Ln(Y))
          else temp:=Exp(X*-1.0*Ln(-1.0*Y));;
 Power := temp;
end;

function LogX(X:real) : real;
var
  temp : double;
begin
 if X>0.0 then temp := Ln(X)/(Ln(10.0))
          else temp := -1.0 * X;
 LogX := temp;
end;

function ArcSin(X:real) : real;
var
  temp : double;
begin
    if Sqr(X) < 1.0 then
    begin
      temp := ArcTan(X/Sqrt(1.0-Sqr(X)));
    end
    else temp := 0.0;
  ArcSin := temp;
end;

function ArcCos(X:real) : real;
var
  temp : double;
begin
  if X <> 0.0 then
  begin
    if (Sqr(X)/X) < 1.0 then
    begin
      temp := ArcTan(Sqrt(1.0-Sqr(X)/X));
    end
    else temp := 0.0;
  end
  else temp := 0.0;
  ArcCos := temp;
end;

function Gauss (Ratio, Mean, Dev : real) : double;
begin
  if (Abs(Dev) > 0.0) then
  begin
    if (sqr((Ratio-Mean)/Dev) < 20000) then
      //Gauss := (1/(Dev*sqrt(2*Pi))) * exp(-sqr((Ratio-Mean)/Dev)/2)
      Gauss := (1/(Dev*sqrt(2*Pi))) * exp(-1.0*(sqr(Ratio-Mean))/(2.0*Dev*Dev))
    else
      Gauss := 0.0;
    end else Gauss := 0.0;
end;

function gammln (xx : double): double;
const
  stp    = 2.50662827465;
  half   = 0.5;
  one    = 1.0;
  fpf    = 5.5;
var
  x, tmp, ser  : double;
  j            : integer;
  cof          : array[1..6] of double;
begin
  cof[1]:=76.18009173;
  cof[2]:=-86.50532033;
  cof[3]:=24.01409822;
  cof[4]:=-1.231739516;
  cof[5]:=0.120858003e-2;
  cof[6]:=-0.536382e-5;
  x:=xx-one;
  tmp:=x+fpf;
  tmp:=(x+half)*ln(tmp)-tmp;
  ser:=one;
  for j:=1 to 6 do
  begin
    x:=x+one;
    ser:=ser+cof[j]/x;
  end;
  result:=(tmp+ln(stp*ser));
end;

function betacf (a,b,x : double): double;
  label 1;
  const
    itmax    = 100;
    eps      = 3.0e-7;
  var
    tem, qap, qam, qab,
    em, d            : double;
    bz, bpp, bp, bm,
    az, app          : double;
    am, aold, ap     : double;
    m                : integer;
begin
  am:=1.0;
  bm:=1.0;
  az:=1.0;
  qab:=a+b;
  qap:=a+1.0;
  qam:=a-1.0;
  bz:=1.0-qab*x/qap;
  for m:=1 to itmax do
  begin
    em:=m;
    tem:=em+em;
    d:=em*(b-m)*x/((qam+tem)*(a+tem));
    ap:=az+d*am;
    bp:=bz+d*bm;
    d:=-(a+em)*(qab+em)*x/((a+tem)*(qap+tem));
    app:=ap+d*az;
    bpp:=bp+d*bz;
    aold:=az;
    am:=ap/bpp;
    bm:=bp/bpp;
    az:=app/bpp;
    bz:=1.0;
    if ((abs(az-aold)) < (eps*abs(az))) then goto 1;
  end;
  {
  ShowMessage('Error in betacf. a or b too big, or itmax too small');
  }
  1: result := az;
end;

function betai (a,b,x : double): double;
  { F prob = betai(0.5*df1,0.5*df2,df2/(df2+df1*F)) }
var
  bt     : double;
begin
  result := 0.0;
  if ((x < 0.0) or (x > 1.0)) then
  begin
    {
    ShowMessage('Input parameter for betai out of range');
    }
  end else
  begin
    if ((x = 0.0) or (x = 1.0))
          then bt:=0.0
          else bt:=exp(gammln(a+b)-gammln(a)-gammln(b)+a*ln(x)+b*ln(1.0-x));
    if (x < ((a+1.0)/(a+b+2.0))) then
    begin
      if (a <> 0.0) then result := bt*betacf(a,b,x)/a
                    else result := 1.0;
    end else
    begin
      if (b <> 0.0) then result := 1.0-bt*betacf(b,a,1.0-x)/b
                    else result := 1.0;
    end;
  end;
end;

function ProbabilityOfF( nu1,nu2 : double;
                         F       : double;
                         Tails : integer) : double;
var
  DF1, DF2, x : double;
  a, b : double;
begin
  x := (1.0*nu2)/(1.0*nu2+F*nu1);
  if (x > 1.0) then x := 1.0/x;
  a := 0.5*nu2;
  b := 0.5*nu1;
  ProbabilityOfF := betai(a,b,x);
  {
  if (F > 1) then
  begin
    DF1 := 1.0*nu1;
    DF2 := 1.0*nu2;
  end else
  begin
    DF1 := 1.0*nu2;
    DF2 := 1.0*nu1;
    F := 1.0/F;
  end;
  if (Tails = 2) then
  begin
    x := (DF2)/(DF2+F*DF1);
    if (x > 1.0) then x := 1.0/x;
    Result := betai(0.5*DF2,0.5*DF1,x)
               + (1.0 - betai(0.5*DF1,0.5*DF2,DF1/(DF1+DF2/F)));
  end else
  begin
    x := (DF2)/(DF2+F*DF1);
    if (x > 1.0) then x := 1.0/x;
    Result := betai(0.5*DF2,0.5*DF1,x);
  end;
  }
end;

end.