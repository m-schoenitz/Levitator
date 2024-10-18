path = File.openDialog("Select a File");

//run("AVI...", "select=[D:/Levitator/experiments 221121/dec pulses cc 1.avi] avi=[D:/Levitator/experiments 221121/dec pulses cc 1.avi] use convert");
run("AVI...", "select=&path avi=&path use convert");

name = getTitle();
id = getImageID();

run("Z Project...", "projection=[Min Intensity]");

setOption("BlackBackground", true);
run("Convert to Mask");
run("Fill Holes");
run("Analyze Particles...", "size=100-Infinity display exclude clear include overlay");

x = getResult("BX",0);
y = getResult("BY",0);
width = getResult("Width",0);
height = getResult("Height",0);
run("Clear Results");

pad = 10;

selectImage(id);
makeRectangle(x-pad, y-pad, width+pad*2, height+pad*2);
run("Crop");

//run("AVI... ", "compression=JPEG frame=30 save=&path");

setAutoThreshold("Default dark");
//run("Threshold...");
setOption("BlackBackground", true);
run("Convert to Mask", "method=Default background=Light calculate black");
//selectWindow("MASK_dec pulses cc 1.avi");
run("Fill Holes", "stack");
run("Analyze Particles...", "size=100-Infinity display exclude clear include overlay stack");

path = File.getDirectory(path);
saveAs("Results", path+"Results.csv");
