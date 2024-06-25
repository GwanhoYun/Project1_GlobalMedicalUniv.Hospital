function messageColor(userInputs, color) {
    userInputs.forEach(userInput => {
        userInput.style.color = color;
    });
}

function messageText(warningTexts, innerText) {
    warningTexts.forEach(warningText => {
        warningText.innerText = innerText;
    });
}

function warningMessage() {
    let userName = document.querySelector('.user_name input'),
        userEmail = document.querySelector('.email input');

    const warningName = document.querySelector('.warning_message_hidden_name'),
        warningEmail = document.querySelector('.warning_message_hidden_email');

    function emailLength(value) {
        return value.length >= 3 && value.length <= 20;
    }

    function nameLength(value) {
        return value.length >= 2 && value.length <= 7;
    }

    function onlyNumberAndEnglish(str) {
        const containsAlphabets = /[A-Za-z]/.test(str);
        const containsNumbers = /\d/.test(str);
        return containsAlphabets && containsNumbers;
    }

    function onlyKorean(str) {
        const containsKoreans = /[가-힣]/.test(str);
        return containsKoreans;
    }

    function removeNonKoreanCharacters(inputElement) {
        const originalValue = inputElement.value;
        let newValue = '';
        for (let i = 0; i < originalValue.length; i++) {
            const char = originalValue.charAt(i);
            // 한글이거나 공백일 경우에만 newValue에 추가
            if (/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/.test(char)) {
                newValue += char;
            }
        }
        // 입력 필드에 새로운 값 적용
        inputElement.value = newValue;
    }
    const koreanOnlyInputs = document.querySelectorAll('.korean-only-input');

    koreanOnlyInputs.forEach(input => {
        input.addEventListener('input', function (event) {
            removeNonKoreanCharacters(event.target);
        });
    })

    // 모든 영어, 숫자 이외의 문자를 지우는 함수
    function removeNonEngNumCharacters(inputElement) {
        const originalValue_Eng = inputElement.value;
        let newValue_Eng = '';
        for (let i = 0; i < originalValue_Eng.length; i++) {
            const char_Eng = originalValue_Eng.charAt(i);
            // 영어 알파벳이나 숫자인 경우에만 newValue_Eng에 추가
            if (/[A-Za-z0-9]/.test(char_Eng)) {
                newValue_Eng += char_Eng;
            }
        }
        // 입력 필드에 새로운 값 적용
        inputElement.value = newValue_Eng;
    }

    // 입력 필드에 이벤트 리스너 추가
    const engAndNumOnlyInputs = document.querySelectorAll('.engNum-only-input');

    engAndNumOnlyInputs.forEach(input => {
        input.addEventListener('input', function (event) {
            removeNonEngNumCharacters(event.target);
        });
    });

    userName.onkeyup = function () {
        if (userName.value.length !== 0) {
            if (!onlyKorean(userName.value)) {
                messageColor([warningName], 'red');
                messageText([warningName], '이름은 한글만 가능합니다.');
            } else if (!nameLength(userName.value)) {
                messageColor([warningName], 'red');
                messageText([warningName], '이름은 2~7자이어야 합니다.');
            } else {
                messageColor([warningName], 'green');
                messageText([warningName], '사용 가능한 이름입니다.');
            }
        } else {
            messageColor([warningName], 'red');
            messageText([warningName], '이름은 필수 입력 사항입니다.');
        }
    }

    userEmail.onkeyup = function () {
        if (userEmail.value.length !== 0) {
            if (!onlyNumberAndEnglish(userEmail.value) && !emailLength(userEmail.value)) {
                messageColor([warningEmail], 'red');
                messageText([warningEmail], '영어, 숫자를 포함 3~20자이어야 합니다.');
            } else if (!onlyNumberAndEnglish(userEmail.value)) {
                messageColor([warningEmail], 'red');
                messageText([warningEmail], '영어와 숫자를 모두 포함해야 합니다.');
            } else if (!emailLength(userEmail.value)) {
                messageColor([warningEmail], 'red');
                messageText([warningEmail], '이메일은 3~20자이어야 합니다.');
            } else {
                messageColor([warningEmail], 'green');
                messageText([warningEmail], '사용 가능한 이메일입니다.');
            }
        } else {
            messageColor([warningEmail], 'red');
            messageText([warningEmail], '이메일은 필수 입력 사항입니다.');
        }
    }

    document.querySelector('.findID_submit_form').addEventListener('submit', function (event4) {
        const emailId = document.getElementById('emailName').value.trim();
        const emailDomain = document.querySelector('.email_domain').value.trim();
        const fullEmail = document.querySelector('.fullEmail');

        if (emailId && emailDomain) {
            fullEmail.value = `${emailId}@${emailDomain}`;
            console.log(`${emailId}@${emailDomain}`);
        } else {
            event4.preventDefault();
        }
    });

    const formBtn = document.querySelector('.findID_submit_form');
    formBtn.addEventListener('submit', function (event) {
        event.preventDefault();

        // 모든 필수 입력 필드에 대해 유효성 검사
        const requiredInputs = document.querySelectorAll('.findID_submit_form [required]');
        let allInputsValid = true;

        requiredInputs.forEach(input => {
            if (!validateInput(input)) {
                allInputsValid = false;
            }
        });

        // 모든 필수 입력 필드가 유효할 경우 폼 제출
        if (allInputsValid) {
            // form.submit();
            console.log('성공');
        } else {
            alert('필수 입력 사항을 올바르게 입력해주세요.');
        }
    });

    // 입력 필드의 유효성 검사 함수
    function validateInput() {
        let userName = document.querySelector('.user_name input').value,
            userEmail = document.querySelector('.email input').value;

        // 필드 유효성 검사 조건에 따라 처리
        if (userName.length === 0 || !onlyKorean(userName) || !nameLength(userName)) {
            return false;
        }
    
        if (userEmail.length === 0 || !onlyNumberAndEnglish(userEmail) || !emailLength(userEmail)) {
            return false;
        }
    
        return true;

    }
}
warningMessage();

