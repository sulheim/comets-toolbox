for i=1:100
main=Main();
main=main.initModels(models);
main=main.initMets(mets);
main=main.initGenomes(50,3,3); 
main.hashMap=masterHash;
main=main.run(20,25,newMets,newModels,10,'Cobra','EX Nitrite e0');
masterHash=main.hashMap;
end