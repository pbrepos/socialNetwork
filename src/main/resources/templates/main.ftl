<#import "parts/common.ftl" as common>

<@common.page>
    <div class="form-group col-md-6">
        <form method="get" action="/main">
            <div class="mb-2">
                <input class="form-control" type="text" name="filter" value="${filter?if_exists}"
                       placeholder="Поиск по тегу"/>
            </div>
            <button class="btn btn-primary" type="submit">Найти</button>
        </form>
    </div>


    <a class="btn btn-primary mt-3 mb-2" data-bs-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="false"
       aria-controls="collapseExample">
        Добавить сообщение
    </a>

    <div class="collapse <#if message??>show</#if>" id="collapseExample">
        <div class="form-group mb-3">
            <form method="post" enctype="multipart/form-data">
                <div class="input-group  mb-3">
                    <input class="form-control ${(textError??)?string('is-invalid', '')}" type="text"
                           value="<#if message??>${message.text}</#if>" name="text" placeholder="Ввудите сообщение"/>
                    <#if textError??>
                        <div class="invalid-feedback">
                         ${textError}
                        </div>
                    </#if>
                </div>
                <div class="input-group mb-3">
                    <input class="form-control ${(textError??)?string('is-invalid', '')}"  type="text"
                           value="<#if message??>${message.text}</#if>" name="tag" placeholder="Тег"/>
                    <#if tagError??>
                        <div class="invalid-feedback">
                            ${tagError}
                        </div>
                    </#if>
                </div>
                <div class="input-group  mb-3">

                    <div class="input-group mb-3">
                        <input type="file" class="form-control" id="customFile" name="file">
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div class="input-group  mb-3">
                    <button class="btn btn-primary" type="submit">Добавить</button>
                </div>
            </form>
        </div>
    </div>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <div class="col h-100">
        <#list messages as message>
            <div class="card">
                <div>
                    <#if message.filename??>
                        <img class="card-img-top" src="/img/${message.filename}">
                    </#if>
                </div>
                <div class="card-body">
                    <b>${message.text}</b>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>
            </div>
            <#else>
                No message
            </#list>
        </div>
    </div>
</@common.page>