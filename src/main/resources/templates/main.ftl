<#import "parts/common.ftl" as common>
<#import "parts/logout.ftl" as logout>
<@common.page>
    <div>
        <@logout.logout/>
        <label><a href="/user">Список пользователей</a></label>
    </div>

    <div>
        <form method="post">
            <input type="text" name="text" placeholder="Ввудите сообщение"/>
            <input type="text" name="tag" placeholder="Тег"/>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit">Добавить</button>
        </form>
    </div>


    <div>Список сообщений</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter}">
        <button type="submit">Найти</button>
    </form>

    <#list messages as message>
        <div>
            <b>${message.id}</b>
            <b>${message.text}</b>
            <i>${message.tag}</i>
            <strong>${message.authorName}</strong>
        </div>
    <#else>
        No message
    </#list>
</@common.page>