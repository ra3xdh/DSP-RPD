#! /usr/bin/gnuplot -persist
# Далее выведем график в виде файла формата png. Primer.png
# Если нужно вывести график на экран, то закомментировать
# следующие две строки
set terminal png
set output "Primer.png" # Здесь для windows подставить полный путь к файлу
# Устанавливаем метки по осям: сейчас по оси Х 
set xlabel "Параметр регуляризациии" 
# Устанавливаем метки по осям: теперь по оси Y
set ylabel "Величина СКО, отн.ед" 
# Устанавливаем предел значений по оси Y 
set yrange [0:1]
# Задаём стиль линии (line1): сплошная прямая(lt - от linetype) с круглыми
# точками (pt - от pointstyle) типа 7 
set style line 1 lt 1 pt 7
#Теперь, задав все параметры, строим график, беря данные из файла Data.dat (для
# примера), где мы строим зависимость второго столбца от первого. Легенду для
# данных второго столбца называем СКО (среднеквадратичное отклонение) и
# заставляем строить график, используя тип линии, который мы задали. 
plot "Data.dat" using 1:2 title "СКО" with linespoints linestyle 1

