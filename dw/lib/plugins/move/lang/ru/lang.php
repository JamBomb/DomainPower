<?php
/**
 * russian language file 
 *
 * @license    GPL 2 (http://www.gnu.org/licenses/gpl.html)
 * @author     S'Adm*n <s-adm_n@mail.ru>
 * @author     Chang Zhao <admin@zen-do.ru>
 */

$lang['menu'] = 'Перемещение/переименование страниц и папок';
$lang['desc'] = 'Плагин для перемещения (переименования) страниц';
$lang['inprogress'] = '(...идёт перемещение...)';
$lang['treelink']   = 'Кроме этой простой формы, для сложной реструктуризации страниц вы можете использовать <a href="%s">древовидную настройку</a>.';

// settings must be present and set appropriately for the language
$lang['encoding']   = 'utf-8';
$lang['direction']  = 'ltr';

// page errors
$lang['notexist']   = 'Страница  %s не существует.';
$lang['norights']   = 'У Вас нет прав редактировать %s.';
$lang['filelocked']  = 'Изменение страницы %s сейчас заблокировано - попробуйте позже.';
$lang['notchanged']    = 'Не задано нового названия %s (адрес не изменён).';
$lang['exists']        = 'Невозможно переместить %s - уже существует страница %s.';
$lang['notargetperms'] = 'У вас недостаточно прав для создания страницы %s.';

// media errors
$lang['medianotexist']      = 'Медиафайла %s не существует';
$lang['nomediarights']      = 'У вас недостаточно прав для удаления %s.';
$lang['medianotchanged']    = 'Не задано нового названия %s (адрес не изменён).';
$lang['mediaexists']        = 'Невозможно переместить %s - уже существует страница %s.';
$lang['nomediatargetperms'] = 'У вас недостаточно прав для создания медиафайла %s.';

// system errors
$lang['indexerror']          = 'Ошибка при обновлении индексирования поиска %s';
$lang['metamoveerror']       = 'Не удалось переместить медиафайлы страницы %s';
$lang['atticmoveerror']      = 'Не удалось переместить архивы (attic) страницы %s. Переместите их вручную.';
$lang['mediametamoveerror']  = 'Не удалось переместить мета-файлы страницы %s.';
$lang['mediamoveerror']      = 'Не удалось переместить медиафайл %s.';
$lang['mediaatticmoveerror'] = 'Не удалось переместить архивы (attic) медиафайла %s. Переместите их вручную.';

// changelog summaries
$lang['renamed']     = 'Имя страницы %s изменено на %s';
$lang['moved']       = 'Страница перемещена из %s в %s';
$lang['move_rename'] = 'Страница перемещена и переименована из %s в %s';
$lang['delete']      = 'Удалено плагином Move (перемещения страниц)';
$lang['linkchange']  = 'Операцией перемещения обновлены ссылки';

// progress view
$lang['intro']        = 'Операция перемещения ещё не начата!';
$lang['preview']      = 'Просмотреть ожидаемые изменения.';
$lang['inexecution']  = 'Предыдущее перемещение не завершилось - кнопками внизу выберите завершение или отмену.';
$lang['btn_start']    = 'Начать';
$lang['btn_continue'] = 'Продолжить';
$lang['btn_retry']    = 'Попытаться ещё';
$lang['btn_skip']     = 'Пропустить';
$lang['btn_abort']    = 'Отменить';

// Form labels
$lang['legend']               = 'Переместить текущую страницу или папку';
$lang['movepage']             = 'Переместить страницу';
$lang['movens']               = 'Переместить папку';
$lang['dst']                  = 'Новое название:';
$lang['content_to_move']      = 'Переместить содержимое:';
$lang['autoskip']             = 'Игнорировать ошибки; пропускать страницы и файлы, которые не удаётся переместить.';
$lang['autorewrite']          = 'По окончании перемещения обновить ссылки.';
$lang['move_pages']           = 'Страницы';
$lang['move_media']           = 'Медиафайлы';
$lang['move_media_and_pages'] = 'Страницы и медиафайлы';
$lang['nodst']                = 'Не задано новое имя';
$lang['noaction']             = 'Не было задано перемещений';

// Rename feature
$lang['renamepage']       = 'Переименовать страницу';
$lang['cantrename']       = 'Сейчас не удаётся переименовать страницу - попробуйте позже.';
$lang['js']['rename']     = 'Переименовать';
$lang['js']['cancel']     = 'Отменить';
$lang['js']['newname']    = 'Новое название:';
$lang['js']['inprogress'] = '...переименование страницы и обновление ссылок...';
$lang['js']['complete']   = 'Перемещение завершено.';

// Tree Manager
$lang['root']             = '[Корневой каталог]';
$lang['noscript']         = 'Для этого требуется включить JavaScript';
$lang['moveinprogress']   = 'Сейчас происходит другая операция перемещения; пока она не закончена, данный инструмент не работает.';
$lang['js']['renameitem'] = 'Переименовать';
$lang['js']['duplicate']  = 'Не получается: "%s" уже существует в данной папке.';
