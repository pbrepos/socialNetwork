<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Имя пользователя :</label>
            <div class="col-sm-6">
                <input class="form-control ${(usernameError??)?string('is-invalid', '')}"
                       value="<#if user??>${user.username}</#if>"
                       type="text" name="username"
                       placeholder="Имя пользователя"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>


        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Пароль:</label>
            <div class="col-sm-6">
                <input class="form-control ${(passwordError??)?string('is-invalid', '')}" type="password"
                       name="password" placeholder="Пароль"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Пароль:</label>
                <div class="col-sm-6">
                    <input class="form-control ${(password2Error??)?string('is-invalid', '')}" type="password"
                           name="password2" placeholder="Повторите пароль"/>
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Email:</label>
                <div class="col-sm-6">
                    <input class="form-control ${(emailError??)?string('is-invalid', '')}"
                           value="<#if user??>${user.email}</#if>"
                           type="email" name="email"
                           placeholder="some@some.com"/>
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <#if !isRegisterForm><a href="/registration">Регистрация</a></#if>
        <button class="btn btn-primary" type="submit"><#if isRegisterForm>Зарегистрироваться<#else>Войти</#if></button>
    </form>
</#macro>