<#import "parts/common.ftl" as common>
<#import "parts/login.ftl" as l>
<@common.page>
    <@l.login "/login"/>

    <a href="/registration">Add new user</a>

</@common.page>