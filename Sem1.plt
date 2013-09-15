#!/usr/bin/gnuplot -persist
# Задаём парамметры сигнала в виде перменных.
# Здесь нужно вписать свои параметры по вариантам.
M_AM=0.55 #коэффициент модуляции АМ - сигнала
M_FM=20000 #коэффициент модуляции ЧМ - сигнала
M_PM=1.5 #коэффициент модуляции ФМ - сигнала
f=200000 #частота несущей, Гц
fm=10000 #частота модулирующего сигнала, Гц
# задаём функции графики которых будем строить. Синтаксис -- как в языке С
s(x)=cos(2*pi*fm*x) #модулирующий сигнал, вместо переменной времени t используем переменную x
U(x)=1+M_AM*s(x) # огибающая 
U_RF(x)=cos(2*pi*f*x) # несущая
U_AM(x)=U(x)*U_RF(x) # АМ - сигнал
U_FM(x)=cos(2*pi*(f+M_FM*s(x))*x) # ЧМ - сигнал
U_PM(x)=cos(2*pi*f*x+M_PM*s(x)) # ФМ - сигнал
set multiplot layout 4,1 # разбиваем окно на 4 графика по вертикали и один 
# график по горизонтали
#set terminal png # раскомментировать эту строку если хотим чтобы график вывелся
# не на экран а в файл PNG. Ещё можно выводить график в файлы PDF,SVG,EPS
set xrange [0:200e-6] #отрезок времени по оси x 0 - 200 мксек
set yrange [-3:3] #растяжка по Y от -3 до 3
set xlabel "Время, сек" # Подпись оси Х
set format x "%.1e" # У чисел на оси Х оставить один знак после запятой
set ylabel "Напряжение, В" # Подпись по оси Y
set ytics 2 # Два деления по оси Х
#set output "1.png" # раскомментировать эту строку если хотим чтобы график вывелся
# не на экран а в файл PNG. Ещё можно выводить график в файлы PDF,SVG,EPS
# График выведется в файл с именем 1.png в текущем каталоге
#set sample 1000 # Пользователям Windows раскомментировать эту строку
plot s(x) title "Огибающая" # строим график Огибающей. title задаёт легенду
plot U_AM(x) title "АМ сигнал" # строим график АМ-сигнала
plot U_FM(x) title "ЧМ сигнал" # строим график ЧМ-сигнала
plot U_PM(x) title "ФМ сигнал", U_RF(x) title "несущая" # Строим график ФМ сигнала и несущей 
# на одном графике. Функции график которых хоти построить указаны через запятую

