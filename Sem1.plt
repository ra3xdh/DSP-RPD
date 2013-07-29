#!/usr/bin/gnuplot -persist
M_AM=0.55 #коэффициент модуляции АМ - сигнала
M_FM=20000 #коэффициент модуляции ЧМ - сигнала
M_PM=1.5 #коэффициент модуляции ФМ - сигнала
f=200000 #частота несущей, Гц
fm=10000 #частота модулирующего сигнала, Гц
s(x)=cos(2*pi*fm*x) #модулирующий сигнал, вместо переменной времени t используем переменную x
U(x)=1+M_AM*s(x) # огибающая
U_RF(x)=cos(2*pi*f*x) # несущая
U_AM(x)=U(x)*U_RF(x) # АМ - сигнал
U_FM(x)=cos(2*pi*(f+M_FM*s(x))*x) # ЧМ - сигнал
U_PM(x)=cos(2*pi*f*x+M_PM*s(x)) # ФМ - сигнал
set multiplot layout 4,1
#set terminal png
set xrange [0:200e-6] #отрезок времени по оси x 0 - 200 мксек
set yrange [-3:3] #растяжка по Y
set xlabel "Время, сек"
set format x "%.1e"
set ylabel "Напряжение, В"
set ytics 2
#set output "1.png"
plot s(x) title "Огибающая"
#set output "2.png"
plot U_AM(x) title "АМ сигнал"
#set xrange [0:100e-6]
#set output "3.png"
plot U_FM(x) title "ЧМ сигнал"
#set output "4.png"
plot U_PM(x) title "ФМ сигнал", U_RF(x) title "несущая"

