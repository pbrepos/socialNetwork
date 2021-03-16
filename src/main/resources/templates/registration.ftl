<#import "parts/common.ftl" as common>
<#import "parts/login.ftl" as login>
<@common.page>
    <p>Добавление нового пользователя</p>
    ${message?if_exists}
    <@login.login "/registration" true/>
</@common.page>