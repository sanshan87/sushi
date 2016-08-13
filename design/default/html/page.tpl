{* Шаблон текстовой страницы *}

{* Канонический адрес страницы *}
{$canonical="/{$page->url}" scope=parent}
{$wrapper = 'second_pages_wrapper.tpl' scope=parent}
{$page->body}