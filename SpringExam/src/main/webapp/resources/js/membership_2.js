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
};

document.querySelectorAll('input[name="age"]').forEach(function (radio) {
    radio.addEventListener('change', checkedAge);
});
window.addEventListener('DOMContentLoaded', (event2) => {
    checkedAge();
});
// ------------------------------------------------------------------
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
            messageText([warningRePw], '비밀번호 확인은 필수 사항입니다.');
        }
    }
    userOfficeNum.onkeyup = function () {
        if (userOfficeNum.value.length !== 0) {
            if (!officeNumLength(userOfficeNum.value)) {
                messageColor([warningOfficeNum], 'red');
                messageText([warningOfficeNum], '유효하지않은 직원번호입니다.');
            } else {
                messageText([warningOfficeNum], ' ');
            }
        } else {
            messageColor([warningOfficeNum], 'red');
            messageText([warningOfficeNum], '직원번호는 필수 입력 사항입니다.');
        }
    }

    userName.onkeyup = function () {
        if (userName.value.length !== 0) {
            if (!onlyKorean(userName.value)) {
                messageColor([warningName], 'red');
                messageText([warningName], '한글만 입력 가능합니다.');
            } else if (!nameLength(userName.value)) {
                messageColor([warningName], 'red');
                messageText([warningName], '이름은 2~6자리 이어야 합니다.');
            } else {
                messageText([warningName], ' ');
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
                messageText([warningGuadianN], '한글만 입력 가능합니다.');
            } else if (!nameLength(userGuadianN.value)) {
                messageColor([warningGuadianN], 'red');
                messageText([warningGuadianN], '이름은 2~6자리 이어야 합니다.');
            } else {
                messageText([warningGuadianN], ' ');
            }
        } else {
            messageColor([warningGuadianN], 'red');
            messageText([warningGuadianN], '보호자 이름은 필수 입력 사항입니다.');
        }
    }


    userRegNum1.onkeyup = function () {
        if (userRegNum1.value.length !== 0) {
            if (!onlyNumber(userRegNum1.value)) {
                messageColor([warningRegNum], 'red');
                messageText([warningRegNum], '숫자만 입력 가능합니다.');
            } else if (!firstRegNumLength(userRegNum1.value)) {
                messageColor([warningRegNum], 'red');
                messageText([warningRegNum], '주민번호 앞자리 6자리를 입력해주세요.');
            } else if (firstRegNumLength(userRegNum1.value) && userRegNum2.value.length === 0) {
                messageColor([warningRegNum], 'red');
                messageText([warningRegNum], '주민번호 뒷자리를 입력해주세요.');
            } else {
                messageText([warningRegNum], ' ');
            }
        } else {
            messageColor([warningRegNum], 'red');
            messageText([warningRegNum], '주민번호는 필수 입력 사항입니다.');
        }
    }
    userRegNum2.onkeyup = function () {
        if (userRegNum2.value.length !== 0) {
            if (!onlyNumber(userRegNum2.value)) {
                messageColor([warningRegNum], 'red');
                messageText([warningRegNum], '숫자만 입력 가능합니다.');
            } else if (!secoundRegNumLength(userRegNum2.value)) {
                messageColor([warningRegNum], 'red');
                messageText([warningRegNum], '주민번호 뒷자리는 7자리 입니다.');
            } else {
                messageText([warningRegNum], ' ');
            }
        } else {
            messageText([warningRegNum], ' ');
        }
    }
    userGuadianRNum1.onkeyup = function () {
        if (userGuadianRNum1.value.length !== 0) {
            if (!onlyNumber(userGuadianRNum1.value)) {
                messageColor([warningGuadianRN], 'red');
                messageText([warningGuadianRN], '숫자만 입력 가능합니다.');
            } else if (!firstRegNumLength(userGuadianRNum1.value)) {
                messageColor([warningGuadianRN], 'red');
                messageText([warningGuadianRN], '주민번호 앞자리 6자리를 입력해주세요.');
            } else if (firstRegNumLength(userGuadianRNum1.value) && userRegNum2.value.length === 0) {
                messageColor([warningGuadianRN], 'red');
                messageText([warningGuadianRN], '주민번호 뒷자리를 입력해주세요.');
            } else {
                messageText([warningGuadianRN], ' ');
            }
        } else {
            messageColor([warningGuadianRN], 'red');
            messageText([warningGuadianRN], '주민번호는 필수 입력 사항입니다.');
        }
    }
    userGuadianRNum2.onkeyup = function () {
        if (userGuadianRNum2.value.length !== 0) {
            if (!onlyNumber(userGuadianRNum2.value)) {
                messageColor([warningGuadianRN], 'red');
                messageText([warningGuadianRN], '숫자만 입력 가능합니다.');
            } else if (!secoundRegNumLength(userGuadianRNum2.value)) {
                messageColor([warningGuadianRN], 'red');
                messageText([warningGuadianRN], '주민번호 뒷자리는 7자리 입니다.');
            } else {
                messageText([warningGuadianRN], ' ');
            }
        } else {
            messageColor([warningGuadianRN], 'red');
            messageText([warningGuadianRN], '주민번호는 필수 입력 사항입니다.');
        }
    }

//----------------------------------------------------------------------------------------------
   const form = document.querySelector('.membership_form');
   form.addEventListener('submit', function (event) {
       event.preventDefault();

       // 모든 필수 입력 필드에 대해 유효성 검사
       const requiredInputs = document.querySelectorAll('.membership_form [required]');
       let allInputsValid = true;

       requiredInputs.forEach(input => {
           if (!validateInput(input)) {
               allInputsValid = false;
           }
       });

       // 모든 필수 입력 필드가 유효할 경우 폼 제출
       if (allInputsValid) {
           form.submit();
    
    
           const nextPageUrl = 'membership_3.html';
           window.location.href = nextPageUrl;
    
    
    
       } else {
           alert('필수 입력 사항을 올바르게 입력해주세요.');
       }
   });

   // 입력 필드의 유효성 검사 함수
   function validateInput(input) {
       const value = input.value.trim();

       // 필드 유효성 검사 조건에 따라 처리
       if (input.classList.contains('user_id')) {
        if (value.length === 0 || !onlyNumberAndEnglish(value) || !idLength(value)) {
            return false;
        } else {
            // 아이디 중복 체크를 비동기로 처리
            return new Promise((resolve) => {
                idCheck((isAvailable) => {
                    resolve(isAvailable);
                });
            });
        }
        } else if (input.classList.contains('user_pw')) {
           return value.length !== 0 && onlyNumberAndEnglish(value) && pwLength(value) && value !== userId.value;
       } else if (input.classList.contains('user_repw')) {
           return value === userPw.value;
       } else if (input.classList.contains('office_num')) {
           return value.length !== 0 && officeNumLength(value);
       } else if (input.classList.contains('user_name') || input.classList.contains('guardian_name')) {
           return value.length !== 0 && onlyKorean(value) && nameLength(value);
       } else if (input.classList.contains('resident_registration_num_form1')) {
           return value.length !== 0 && onlyNumber(value) && firstRegNumLength(value);
       } else if (input.classList.contains('resident_registration_num_form2')) {
           return value.length !== 0 && onlyNumber(value) && secoundRegNumLength(value);
       }

        // 기타 필드에 대한 추가적인 유효성 검사가 필요한 경우 처리
       return true;
    }
}

warningMessage();