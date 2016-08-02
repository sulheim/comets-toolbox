function sequence=decode(hash, mets, models)
    sequence={};
    counter=1;
    for i=1:2:6
       temp=hash(i:i+1); 
       num=str2num(temp);
       if num>20
           num=num-20;
       end
       met=mets(counter);
       sequence(counter)=met;
       counter=counter+1;
    end
    
    for i=7:2:12
       temp=hash(i:i+1);
       num=str2num(temp);
       if num==1
           name='K1';
       elseif num==2
           name='K1A';
       elseif num<11
           name=strcat('K',num2str(num-1));
       elseif num==11
           name='K9A';
       else
           name=strcat('K',num2str(num-2));
       end
       name={name};
       sequence(counter)=name;
       counter=counter+1;
    end
end