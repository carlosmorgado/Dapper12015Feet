$fn = 50;

tolerance = 1;

draperDepth = 162;
draperDepthWithTolerance = draperDepth + tolerance;
draperWidth = 502;

frontSize = 15;
feetHeight = 70;

feetBaseBorderHeight = frontSize;
feetBaseBorderThickness = 2;
feetBaseWidth = 135;
feetBaseDepth = draperDepthWithTolerance;
feetBaseThickness = 2;

feetBaseHollow = [feetBaseWidth, feetBaseDepth, feetBaseBorderHeight];
feetBaseWithBorder = [
    feetBaseWidth + feetBaseBorderThickness,
    feetBaseBorderThickness + feetBaseDepth + feetBaseBorderThickness,
    feetBaseThickness + feetBaseBorderHeight];

difference(){
    cube(feetBaseWithBorder, center=false);
    translate([0, feetBaseBorderThickness, feetBaseThickness]){
        cube(feetBaseHollow, center=false);
    }
}