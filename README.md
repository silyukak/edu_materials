# Учебные материалы

Исходники документов находятся в отдельных каталогах. Для сборки всех `.tex`
файлов используется `Makefile`.

## Зависимости

Нужны:

- TeX Live или MiKTeX с `latexmk` и `XeLaTeX`;
- шрифты `DejaVu Serif` и `DejaVu Sans Mono`;
- пакеты LaTeX, используемые исходниками (`fontspec`, `polyglossia`, `amsmath`,
  `geometry`, `tcolorbox` и другие).

Например, в Debian/Ubuntu базовую часть можно установить так:

```sh
sudo apt install latexmk texlive-xetex texlive-latex-extra texlive-lang-cyrillic fonts-dejavu
```

## Сборка

```sh
git clone <URL-репозитория>
cd edu_materials
make
```

PDF-файлы появятся рядом с соответствующими `.tex`-файлами. Временные файлы
можно удалить командой `make clean`.

Команда `make distclean` дополнительно удаляет сгенерированные PDF.