$fn = 50;

tolerance = 1;

draperDepth = 162;
draperDepthWithTolerance = draperDepth + tolerance;
draperWidth = 502;

frontSize = 15;
feetHeight = 70;
feetThickness = 2;

feetBaseBorderHeight = frontSize;
feetBaseBorderThickness = 2;
feetBaseWidth = 35;
feetBaseDepth = draperDepthWithTolerance;
feetBaseThickness = 2;

totalFeetBaseWidth = feetBaseWidth + feetBaseBorderThickness;
totalFeetBaseDepth = feetBaseBorderThickness + feetBaseDepth + feetBaseBorderThickness;
totalFeetBaseHeight = feetBaseThickness + feetBaseBorderHeight;

feetBaseHollow = [feetBaseWidth, feetBaseDepth, feetBaseBorderHeight];
feetBaseWithBorder = [
    totalFeetBaseWidth,
    totalFeetBaseDepth,
    totalFeetBaseHeight];

union(){
    feet();
    translate([0, 0, feetHeight]){
        difference(){
            cube(feetBaseWithBorder, center=false);
            translate([0, feetBaseBorderThickness, feetBaseThickness]){
                cube(feetBaseHollow, center=false);
            }
        }
    }
}

module feet(){
    frontFoot();
    backFoot();
}

module backFoot(){
    translate([totalFeetBaseWidth, totalFeetBaseDepth - totalFeetBaseWidth, 0])
    rotate([0, 0, 90])
    foot();
}

module frontFoot(){
    foot();
}

module foot(){
    union(){
        translate([0, feetThickness, 0]){
            footFrontFace();
        }
        translate([totalFeetBaseWidth, totalFeetBaseWidth, 0]){
            footSideFace();
        }
    }
}

module footSideFace(){
    rotate(a = [90, 0, -90]){
        linear_extrude(height = feetThickness){
            polygon([
                [0, feetHeight],
                [totalFeetBaseWidth, feetHeight],
                [totalFeetBaseWidth, 0],
                [totalFeetBaseWidth * 2/3 , 0]]);
        }
    }
}

module footFrontFace(){
    rotate(a = [90, 0, 0]){
        linear_extrude(height = feetThickness){
            polygon([
                [0, feetHeight],
                [totalFeetBaseWidth, feetHeight],
                [totalFeetBaseWidth, 0],
                [totalFeetBaseWidth * 2/3 , 0]]);
        }
    }
}