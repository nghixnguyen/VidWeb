document.getElementById('username').addEventListener('input', function(ev) {
    validateField(ev.target, isUsernameValidFormat);
});

document.getElementById('password').addEventListener('input', function(ev) {
    validateField(ev.target, isPasswordValidFormat);
});

document.getElementById('re-enter password').addEventListener('input', function(ev) {
    validateField(ev.target, validateReEnterPassword);
});

document.getElementById('reg-form').addEventListener('submit', function(ev) {
    var usernameInput = document.getElementById('username');
    var passwordInput = document.getElementById('password');
    var reEnterPasswordInput = document.getElementById('re-enter password');

    var isUsernameValid = validateField(usernameInput, isUsernameValidFormat);
    var isPasswordValid = validateField(passwordInput, isPasswordValidFormat);
    var isReEnterPasswordValid = validateField(reEnterPasswordInput, validateReEnterPassword);


    if (!isUsernameValid || !isPasswordValid || !isReEnterPasswordValid) {
        ev.preventDefault();
        var errorMessage = "Please ensure the following fields are valid:\n";
        var invalidFields = [];

        if (!isUsernameValid) {
            invalidFields.push("Username");
        }

        if (!isPasswordValid) {
            invalidFields.push("Password");
        }

        if (!isReEnterPasswordValid) {
            invalidFields.push("Re-enter Password");
        }

        for (var i = 0; i < invalidFields.length; i++) {
            switch (invalidFields[i]) {
                case "Username":
                    errorMessage += "- Invalid Username\n";
                    break;
                case "Password":
                    errorMessage += "- Invalid Password\n";
                    break;
                case "Re-enter Password":
                    errorMessage += "- Invalid Re-enter Password\n";
                    break;
            }
        }

        alert(errorMessage);
    }
});

function validateField(inputElement, validatorFunction) {
    var userInput = inputElement;
    var value = userInput.value;

    var isValid = validatorFunction(value);

    if (isValid) {
        userInput.classList.remove("invalid-input");
        userInput.classList.add("valid-input");
    } else {
        userInput.classList.remove("valid-input");
        userInput.classList.add("invalid-input");
    }

    return isValid;
}

function isUsernameValidFormat(username) {
    var firstChar = username.charAt(0);

    return username.length >= 3 && ((firstChar >= 'A' && firstChar <= 'Z') 
    || (firstChar >= 'a' && firstChar <= 'z'));
}

function isPasswordValidFormat(password) {
    var hasValidLength = password.length >= 8;
    var uppercaseFound = false;
    var numberFound = false;
    var specialCharFound = false;
    var specialChars = ['/','*','-','+','!','@','#','$','^','&','~','[',']'];

    for (var i = 0; i < password.length; i++) {
        var char = password[i];

        if (char >= 'A' && char <= 'Z') {
            uppercaseFound = true;
        } else if (char >= '0' && char <= '9') {
            numberFound = true;
        } else if (specialChars.includes(char)) {
            specialCharFound = true;
        }
    }

    return hasValidLength && uppercaseFound && numberFound && specialCharFound;
}

function validateReEnterPassword(reEnterPassword, password) {
    var reEnterPassword = reEnterPassword;
    var password = document.getElementById('password').value;
    return reEnterPassword === password;
}