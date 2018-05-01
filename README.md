# vim-yawiki ![travis-ci](https://travis-ci.org/elricbk/vim-yawiki.svg?branch=master)

Плагин для работы с Яндексовой вики-разметкой. Поддерживает:
* Подсветку синтаксиса
* Folding секций и врезок
* Переход по заголовкам с помощью `]]` и `[[`
* Клавиши для форматирования текста

![Пример форматирования](https://cloud.githubusercontent.com/assets/4334930/23220632/a273b6b4-f933-11e6-9e80-281dcfd488fc.png)

## Подсветка синтаксиса ##

Поддерживаются следующие виды разметки:

* Заголовки
* Базовое форматирование (полужирный, курсивный, подчёркнутый, моноширинный, мелкий, зачёркнутый текст; вопросы, замечания, текст синего/красного/зелёного/жёлтого/серого цвета)
* Цитирование текста (однострочное и многострочное)
* Термины
* Врезки
* Вывод HTML/код (без поддержки подсветки внутри)
* Логины (`this@`, `@that` и `кто:login`)
* Команды (подсвечиваются целиком, параметры внутри не размечаются)
* Ссылки (прямо в тексте, в круглых и квадратных скобках)
* Разметка таблиц
* Номера тикетов
* HTML entities

Вложенная разметка не поддерживается (bold italic, например, не работает).
Подсветка в основном задавалась через стандартные группы (`String`, `Comment`, etc.), поэтому нормально должна выглядеть на любой цветовой схеме. Там, где нужны были конкретные цвета (например, для разноцветных заметок), они задавались через стандартные цвета цветовой схемы (`darkred`, `green`, etc.).

## Folding ##

Fold-ы добавляются для всех секций (уровень fold-а соответствует уровню секции минус один, т.е. для заголовков первого уровня fold не добавляется) и врезок (уровень fold-а равно уровню текущей секции плюс 1).

Автоматически ничего не сворачивается, специальные символы для сворачивания элементов списка не поддерживаются.

## Переход по секциям ##

Добавлены `]]` и `[[`, которые ходят по заголовкам вперёд и назад соответственно. Уровень заголовков при этом не учитывается.

## Форматирование ##

Плагин определяет несколько комбинаций доступных для использования:

    <Plug>(yawiki-mark-bold)
    <Plug>(yawiki-mark-code)
    <Plug>(yawiki-mark-escaped)
    <Plug>(yawiki-mark-italic)
    <Plug>(yawiki-mark-link)
    <Plug>(yawiki-mark-monospaced)
    <Plug>(yawiki-mark-note)
    <Plug>(yawiki-mark-quote)
    <Plug>(yawiki-mark-strikeout)
    <Plug>(yawiki-mark-underline)

Каждая комбинация рассчитана на использование в `visual`-режиме и оборачивает выделенный текст в соответствующее форматирование.

### Комбинации клавиш по умолчанию ##

По умолчанию для форматирования назначаются комбинации клавиш, которые начинаются с `<Leader>m` (мнемоника _mark bold_, _mark italic_ и т.д.).

    vmap <buffer> <Leader>mb <Plug>(yawiki-mark-bold)
    vmap <buffer> <Leader>mc <Plug>(yawiki-mark-code)
    vmap <buffer> <Leader>me <Plug>(yawiki-mark-escaped)
    vmap <buffer> <Leader>mi <Plug>(yawiki-mark-italic)
    vmap <buffer> <Leader>ml <Plug>(yawiki-mark-link)
    vmap <buffer> <Leader>mm <Plug>(yawiki-mark-monospaced)
    vmap <buffer> <Leader>mn <Plug>(yawiki-mark-note)
    vmap <buffer> <Leader>mq <Plug>(yawiki-mark-quote)
    vmap <buffer> <Leader>ms <Plug>(yawiki-mark-strikeout)
    vmap <buffer> <Leader>mu <Plug>(yawiki-mark-underline)

Отключить комбинации клавиш по умолчанию можно с помощью опции `g:yawiki_disable_formatting`.

### Комбинации для кириллицы ###

Если хочется использовать эти же комбинации клавиш не переключаясь с русского на английский, то можно использовать опцию `g:yawiki_cyrillic_prefix`. Её нужно установить в ту букву, которая соответствует используемому `mapleader` в русской раскладке. Например, при использовании в качестве `mapleader` запятой, можно написать:

    let g:yawiki_cyrillic_prefix = 'б'

После этого маппинги должны заработать и для русской раскладки клавиатуры тоже.
