#!/bin/bash

# Проверка на наличие аргумента
if [ -z "$1" ]; then
    echo "Ошибка: Не указан путь."
    exit 1
fi

# Проверка на существование пути
if [ ! -d "$1" ]; then
    echo "Ошибка: Путь '$1' не существует."
    exit 1
fi

# Если указан второй аргумент (целевая директория), используем его, иначе создаем файлы в текущей директории
target_dir=${2:-.}

# Перебор всех подкаталогов в указанном пути
for dir in "$1"/*/; do
    if [ -d "$dir" ]; then
        # Получение имени подкаталога
        dir_name=$(basename "$dir")
        # Подсчет количества элементов в подкаталоге (включая скрытые файлы)
        count=$(ls -1A "$dir" | wc -l)
        # Создание файла с именем подкаталога и запись в него количества элементов
        echo "$count" > "$target_dir/$dir_name"
    fi
done

echo "Скрипт успешно завершен."
