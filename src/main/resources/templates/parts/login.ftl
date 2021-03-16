<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> User Name :</label>
            <div class="col-sm-6">
                <input class="form-control" type="text" name="username" placeholder="Имя пользователя"/>
            </div>
        </div>


        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Password: :</label>
            <div class="col-sm-6">
                <input class="form-control"  type="password" name="password" placeholder="Пароль"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <#if !isRegisterForm><a href="/registration">Регистрация</a></#if>
        <button class="btn btn-primary" type="submit"><#if isRegisterForm>Зарегистрироваться<#else>Войти</#if></button>
    </form>
</#macro>