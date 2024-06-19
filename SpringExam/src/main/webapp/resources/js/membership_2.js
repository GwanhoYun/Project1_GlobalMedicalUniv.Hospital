//약관 체크박스 (모두 동의)
document.querySelector('.all_check').addEventListener('change', function () {
    const allCheck = document.querySelectorAll('.check');
    const allCheckStatus = document.querySelector('.all_check').checked;
    const membershipDisplay = document.querySelector('.membership_container');

    allCheck.forEach(function (checkbox) {
        checkbox.checked = allCheckStatus;
    });

    membershipDisplay.style.display = allCheckStatus ? 'block' : 'none';
});

const slaveCheck = document.querySelectorAll('.check');
slaveCheck.forEach(function (checkbox) {
    checkbox.addEventListener('change', function () {
        const masterCheck = document.querySelector('.all_check');
        const membershipDisplay = document.querySelector('.membership_container');
        const allChecked = Array.from(slaveCheck).every(cb => cb.checked);

        masterCheck.checked = allChecked;
        membershipDisplay.style.display = allChecked ? 'block' : 'none';
    });
});

function getQueryParams() {
    const params = {};
    window.location.search.substring(1).split("&").forEach(param => {
        const [key, value] = param.split("=");
        params[key] = decodeURIComponent(value);
    });
    return params;
}

window.addEventListener('DOMContentLoaded', (event1) => {
    const params = getQueryParams();
    const ageValue = params['age'];

    if (ageValue) {
        document.querySelector(`input[name="age"][value="${ageValue}"]`).checked = true;
        checkedAge();
    }
});

function idCheck(callback) {
    var id = document.getElementById('getId').value;
    var data = { id: id };

    $.ajax({
        type: "post",
        url: "/memberIdChk",
        data: data,
        success: function(result) {
            console.log("성공 여부: " + result);
            callback(result === 'success');
        }
    });
}

function toggleDisplay(elements, display) {
    elements.forEach(element => {
        element.style.display = display;
    });
}

function toggleRequired(inputs, isRequired) {
    inputs.forEach(input => {
        if (isRequired) {
            input.setAttribute('required', 'required');
        } else {
            input.removeAttribute('required');
        }
    });
}

function checkedAge() {
    const checkedRadio = document.querySelector('input[name="age"]:checked'),
        medicalOffice = document.querySelector('.medical_office'),
        guardianName = document.querySelector('.guardian_name'),
        guardianNum = document.querySelector('.guardian_resident_registration_num'),
        guardianNameInput = document.querySelector('.guardian_name input'),
        guardianNumInput = document.querySelector('.guardian_resident_registration_num input'),
        officeNum = document.querySelector('.office_num'),
        officeNumInput = document.querySelector('.office_num input');

    if (checkedRadio.value === 'under14') {
        toggleDisplay([medicalOffice, officeNum], 'none');
        toggleDisplay([guardianName, guardianNum], 'table-row');
        toggleRequired([guardianNameInput, guardianNumInput], true);
        toggleRequired([officeNumInput], false);

    } else if (checkedRadio.value === 'over14') {
        toggleDisplay([medicalOffice, officeNum, guardianName, guardianNum], 'none');
        toggleRequired([guardianNameInput, guardianNumInput, officeNumInput], false);
        
    } else {
        toggleDisplay([medicalOffice, officeNum], 'table-row');
        toggleDisplay([guardianName, guardianNum], 'none');
        toggleRequired([guardianNameInput, guardianNumInput], false);
        toggleRequired([officeNumInput], true);
    }
}

document.querySelectorAll('input[name="age"]').forEach(function (radio) {
    radio.addEventListener('change', checkedAge);
});

window.addEventListener('DOMContentLoaded', (event2) => {
    checkedAge();
});

// 회원가입 유효성 검사
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
    let userId = document.querySelector('.user_id td input'),
        userPw = document.querySelector('.user_pw td input'),
        userRePw = document.querySelector('.user_repw td input'),
        userOfficeNum = document.querySelector('.office_num td input'),
        userName = document.querySelector('.user_name td input'),
        userGuadianN = document.querySelector('.guardian_name td input'),
        userRegNum1 = document.querySelector('.user_resident_registration_num .resident_registration_num_form1'),
        userRegNum2 = document.querySelector('.user_resident_registration_num .resident_registration_num_form2'),
        userGuadianRNum1 = document.querySelector('.guardian_resident_registration_num .resident_registration_num_form1'),
        userGuadianRNum2 = document.querySelector('.guardian_resident_registration_num .resident_registration_num_form2');
    
    const warningId = document.querySelector('.warning_message_hidden_id'),
        warningPw = document.querySelector('.warning_message_hidden_pw'),
        warningRePw = document.querySelector('.warning_message_hidden_repw'),
        warningOfficeNum = document.querySelector('.warning_message_hidden_officeNum'),
        warningName = document.querySelector('.warning_message_hidden_name'),
        warningGuadianN = document.querySelector('.warning_message_hidden_guadianName'),
        warningRegNum = document.querySelector('.warning_message_hidden_regNum'),
        warningGuadianRN = document.querySelector('.warning_message_hidden_guadianRegNum');

    function idLength(value) {
        return value.length >= 6 && value.length <= 15;
    }

    function pwLength(value) {
        return value.length >= 9 && value.length <= 16;
    }

    function officeNumLength(value) {
        return value.length === 3;
    }

    function nameLength(value) {
        return value.length >= 2 && value.length <= 7;
    }

    function firstRegNumLength(value) {
        return value.length === 6;
    }

    function secoundRegNumLength(value) {
        return value.length === 7;
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

    function onlyNumber(str) {
        const containsNumbers = /\d/.test(str);
        return containsNumbers;
    }

    userId.onkeyup = function () {
        if (userId.value.length !== 0) {
            if (!onlyNumberAndEnglish(userId.value)) {
                messageColor([warningId], 'red');
                messageText([warningId], '영어와 숫자를 모두 포함해야 합니다.');
            } else if (!idLength(userId.value)) {
                messageColor([warningId], 'red');
                messageText([warningId], '아이디는 6~15자이어야 합니다.');
            } else {
                idCheck(function(isAvailable) {
                    if (isAvailable) {
                        messageColor([warningId], 'green');
                        messageText([warningId], '사용 가능한 아이디입니다.');
                    } else {
                        messageColor([warningId], 'red');
                        messageText([warningId], '이미 사용중인 아이디 입니다.');
                    }
                });
            }
        } else {
            messageColor([warningId], 'red');
            messageText([warningId], '아이디는 필수 입력 사항입니다.');
        }
    }

    userPw.onkeyup = function () {
        if (userPw.value.length !== 0) {
            if (!onlyNumberAndEnglish(userPw.value)) {
                messageColor([warningPw], 'red');
                messageText([warningPw], '영어와 숫자를 모두 포함해야 합니다.');
                userRePw.disabled = true;
            } else if (!pwLength(userPw.value)) {
                messageColor([warningPw], 'red');
                messageText([warningPw], '비밀번호는 9~16자이어야 합니다.');
                userRePw.disabled = true;
            } else if (userPw.value === userId.value) {
                messageColor([warningPw], 'red');
                messageText([warningPw], '아이디와 비밀번호가 동일합니다.');
                userRePw.disabled = true;
            } else {
                messageColor([warningPw], 'green');
                messageText([warningPw], '사용 가능한 비밀번호입니다.');
                userRePw.disabled = false;
            }
        } else {
            messageColor([warningPw], 'red');
            messageText([warningPw], '비밀번호는 필수 입력 사항입니다.');
            userRePw.disabled = true;
        }
    }

    userRePw.onkeyup = function () {
        if (userRePw.value.length !== 0) {
            if (userRePw.value === userPw.value) {
                messageColor([warningRePw], 'green');
                messageText([warningRePw], '비밀번호가 동일합니다.');
            } else {
                messageColor([warningRePw], 'red');
                messageText([warningRePw], '비밀번호가 다릅니다.');
            }
        } else {
            messageColor([warningRePw], 'red');
            messageText([warningRePw], '비밀번호 재확인은 필수 입력 사항입니다.');
        }
    }

    userOfficeNum.onkeyup = function () {
        if (userOfficeNum.value.length !== 0) {
            if (onlyNumber(userOfficeNum.value)) {
                if (!officeNumLength(userOfficeNum.value)) {
                    messageColor([warningOfficeNum], 'red');
                    messageText([warningOfficeNum], '번호는 3자리입니다.');
                } else {
                    messageColor([warningOfficeNum], 'green');
                    messageText([warningOfficeNum], '유효한 번호입니다.');
                }
            } else {
                messageColor([warningOfficeNum], 'red');
                messageText([warningOfficeNum], '유효한 숫자를 입력해주세요.');
            }
        } else {
            messageColor([warningOfficeNum], 'red');
            messageText([warningOfficeNum], '의원 번호는 필수 입력 사항입니다.');
        }
    }

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

    userGuadianN.onkeyup = function () {
        if (userGuadianN.value.length !== 0) {
            if (!onlyKorean(userGuadianN.value)) {
                messageColor([warningGuadianN], 'red');
                messageText([warningGuadianN], '이름은 한글만 가능합니다.');
            } else if (!nameLength(userGuadianN.value)) {
                messageColor([warningGuadianN], 'red');
                messageText([warningGuadianN], '이름은 2~7자이어야 합니다.');
            } else {
                messageColor([warningGuadianN], 'green');
                messageText([warningGuadianN], '사용 가능한 이름입니다.');
            }
        } else {
            messageColor([warningGuadianN], 'red');
            messageText([warningGuadianN], '보호자 이름은 필수 입력 사항입니다.');
        }
    }

    function validateRegNumPart1(input, warningElement) {
        if (input.value.length !== 0) {
            if (onlyNumber(input.value)) {
                if (!firstRegNumLength(input.value)) {
                    messageColor([warningElement], 'red');
                    messageText([warningElement], '숫자 6자리입니다.');
                } else {
                    messageColor([warningElement], 'green');
                    messageText([warningElement], '유효한 번호입니다.');
                }
            } else {
                messageColor([warningElement], 'red');
                messageText([warningElement], '유효한 숫자를 입력해주세요.');
            }
        } else {
            messageColor([warningElement], 'red');
            messageText([warningElement], '앞자리 번호는 필수 입력 사항입니다.');
        }
    }

    function validateRegNumPart2(input, warningElement) {
        if (input.value.length !== 0) {
            if (onlyNumber(input.value)) {
                if (!secoundRegNumLength(input.value)) {
                    messageColor([warningElement], 'red');
                    messageText([warningElement], '숫자 7자리입니다.');
                } else {
                    messageColor([warningElement], 'green');
                    messageText([warningElement], '유효한 번호입니다.');
                }
            } else {
                messageColor([warningElement], 'red');
                messageText([warningElement], '유효한 숫자를 입력해주세요.');
            }
        } else {
            messageColor([warningElement], 'red');
            messageText([warningElement], '뒷자리 번호는 필수 입력 사항입니다.');
        }
    }

    userRegNum1.onkeyup = function () {
        validateRegNumPart1(userRegNum1, warningRegNum);
    }

    userRegNum2.onkeyup = function () {
        validateRegNumPart2(userRegNum2, warningRegNum);
    }

    userGuadianRNum1.onkeyup = function () {
        validateRegNumPart1(userGuadianRNum1, warningGuadianRN);
    }

    userGuadianRNum2.onkeyup = function () {
        validateRegNumPart2(userGuadianRNum2, warningGuadianRN);
    }
}

warningMessage();
