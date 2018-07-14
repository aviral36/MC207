# Script 1

y=dsolve('D2y+Dy=-2*y','y(0)=2','Dy(0)=2');
ezplot(y,[0,20])

# Script 2

y=dsolve('D2y=-2*y','y(0)=8','Dy(0)=1');
ezplot(y,[0,20])

# Sccript 3

y=dsolve('D2y+4*Dy=-4*y','y(0)=4','Dy(0)=9');
ezplot(y,[0,20])
