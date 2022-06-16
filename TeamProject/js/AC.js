function ACsubmit(){
        // var namec = document.getElementById('name');
        // var nickc = document.getElementById('nick');
        // var idc = document.getElementById('id');
        // var passc = document.getElementById('pass');
        // var pass2c = document.getElementById('pass2');
        // var birthc = document.getElementById('birth');
        // var telc = document.getElementById('tel');
        var namec = document.createAccount.name;
        var nickc = document.createAccount.nick;
        var idc = document.createAccount.id;
        var passc = document.createAccount.pass;
        var pass2c = document.createAccount.pass2;
        var birthc = document.createAccount.birth;
        var telc = document.createAccount.tel;
        
        if(namec.value==""){
            alert("이름을 입력해주세요");
            namec.focus();
        }
        else if(nickc.value==""){
            alert("닉네임을 입력해주세요");
            nickc.focus();
        }
        else if(idc.value==""){
            alert("아이디를 입력해주세요");
            idc.focus();
        }
        else if(passc.value==""){
            alert("비밀번호를 입력해주세요");
            passc.focus();
        }
        else if(pass2c.value==""){
            alert("비밀번호확인을 입력해주세요");
            pass2c.focus();
        }
        else if(birthc.value==""){
            alert("생년월일을 선택해주세요");
            birthc.focus();
        }
        else if(telc.value==""){
            alert("전화번호를 입력해주세요");
            telc.focus();
        }else if(namec.value != ""){
        	if(nickc.value != ""){
        		if(idc.value != ""){
        			if(passc.value != ""){
        				if(pass2c.value != ""){
        					if(passc.value == pass2c.value){
        						if(birthc.value != ""){
        							if(telc.value != ""){
        								//부모창을 페이지 이동시킴
	                                    opener.location.href="login.html";
        							}
        						}
        					}
        				}
        			}
        		}
        	}
        }
    }    