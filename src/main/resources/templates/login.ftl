<#import "parts/common.ftl" as common>
<#import "parts/login.ftl" as l>
<@common.page>
    ${message?if_exists}
    <@l.login "/login" false/>

</@common.page>