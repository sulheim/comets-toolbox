% Uday Tripathi 7/2016
function modModel=changeMetLevels(model,mets,metsToKeep)

% strfind(K1.rxnNames,'glu')
% x=find(~cellfun(@isempty,ans))
% s=strfind(K1.rxnNames,'e0')
% y=find(~cellfun(@isempty,s))
% intersect(x,y)
    metsToKeep=metsToKeep(~cellfun('isempty',metsToKeep));  

    tempModel=model;
    idList={};
    for j=1:length(mets)
        rxnIndex=strmatch(mets{j},tempModel.rxnNames);
        rxnId=tempModel.rxns(rxnIndex);
        idList=[idList,rxnId];
    end
    tempModel=changeRxnBounds(tempModel,idList,0,'b');
    
    incList={};
    for r=1:length(metsToKeep)
        rxnIndex=strmatch(metsToKeep(r),tempModel.rxnNames);
        rxnId=tempModel.rxns(rxnIndex);
        incList=[incList,rxnId];
    end
    tempModel=changeRxnBounds(tempModel,incList,1000,'u');
    tempModel=changeRxnBounds(tempModel,incList,-1000,'l');
    modModel=tempModel;  
end