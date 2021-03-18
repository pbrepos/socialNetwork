<#import "parts/common.ftl" as common>
<@common.page>
    <h5>${username}</h5>
    ${message?if_exists}
    <form method="post">

        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Пароль: :</label>
            <div class="col-sm-6">
                <input class="form-control" type="password" name="password" placeholder="Пароль"/>
            </div>
        </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Email: :</label>
                <div class="col-sm-6">
                    <input class="form-control" type="email" name="email" placeholder="some@some.com" value="${email!''}"/>
                </div>
            </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button class="btn btn-primary" type="submit">Сохранить</button>
    </form>
</@common.page>