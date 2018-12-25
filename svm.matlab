t=fitcsvm(a1,c1,'BoxConstraint',1000);
sv = t.SupportVectors;
figure
pos=find(c1==0)
neg=find(c1==1)
hold on
plot(a1(pos,1),a1(pos,2),'r+')
plot(a1(neg,1),a1(neg,2),'bo')
plot(sv(:,1),sv(:,2),'ko','MarkerSize',10)
legend('pos','neg','Support Vector')
title('support vectors')
l='hhhhhhhh'
es=resubLoss(t)
y=predict(t,a1)
c=confusionmat(c1,y)
confmat(c)
svt=crossval(t,'Kfold',5)
svt.Trained
svt.kfoldLoss('Mode','individual')
ys1=predict(svt.Trained{1},a1)