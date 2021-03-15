<#import "parts/common.ftl" as common>

<@common.page>
    <p>Редактирование профиля пользователя</p>
    <form action="/user" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="hidden" name="userId" value="${user.id}"> </label>
        <div><label> User Name : <input type="text" name="username" value="${user.username}"> </label></div>
        <#list roles as role>
            <div>
                <label><input type="checkbox"
                              name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <button type="submit">Сохранить</button>
    </form>

    <label><a href="/main">Главная страница</a></label>
</@common.page>