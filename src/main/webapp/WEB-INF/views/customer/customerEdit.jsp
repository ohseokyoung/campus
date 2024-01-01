<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        main {
            display: flex; 
        }

        body {
            background-color: #FFFAFD;         
        }

        li {
            list-style: none;
        }

        .side {
            background-color: #ddd;
            width: 300px;
            height: 500px;
            text-align: center;
            margin-left: 50px;
            margin-top: 100px;
            margin-right: 100px;
        }

        .side>li {
            padding: 20px;
        }

        a {
            text-decoration: none;
            color: black;
        }

        .board>div>li {
            margin-left: 20px;
            margin-right: 20px;
            text-align: center;
            min-width: 100px;
        }

        #subject {
            min-width: 220px;
            margin-left: 20px;
            margin-right: 20px;
        }

        .board {
            border: none;                 
        }

        .board>div {
            display: flex;
            justify-content: space-between;
            border-bottom: 2px solid #ddd;
            padding: 10px;
            margin-left: 20px;
            margin-right: 20px;
        }

        .form-group {
            margin-bottom: 10px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input,
        select,
        textarea {
            display: block;
            width: 100%; 
            padding: 10px;
            box-sizing: border-box;
            resize: none;
        }

        button {
            display: block;
            width: 20%;
            padding: 10px;
            background-color: #004E6d;
            color: white;
            border: none;
            cursor: pointer;
        }

        article {
            flex: 1;
            margin-right: 100px;
        }

        .paging {
            margin-top: 10px; 
            text-align: center;
        }
    </style> 
</head>

<body>
   >
    <main>
        <aside class="side">   
            <img style="margin-top:30px;" src="https://cdn.discordapp.com/attachments/1173898314333311017/1174511819189145642/image.png?ex=6567dc5f&is=6555675f&hm=55b79a73f8198c84355bb144fa909f46166d47932ab6aca6ca1e83196d1a92d3&">
            <li><a href="/customer/customerWrite"><b>문의글 쓰기</b></a></li>
            <li><a href="/customer/customerMain">문의사항 메인</a></li>
            <li><a href="/customer/myquestion">나의 문의사항</a></li>
        </aside>
        <article>
            <h2 style="margin-top:100px; margin-bottom:70px;">고객센터 문의 글쓰기</h2> 
                <div class="board">
                    <form action="/customer/customerEditOk" method="post">
                        <div class="form-group">
                            <label for="type">문의유형</label>
                            <select id="type" name="type" required>
                                <option value="">문의유형을 선택하세요</option>
                                <option value="서비스문의">서비스 문의</option>
                                <option value="건의">건의</option>
                                <option value="버그">버그</option>
                                <option value="기타">기타</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="title">제목</label>
                            <input type="text" id="title" name="subject" placeholder="제목을 입력하세요" value="${vo.subject }"required>
                        </div>

                        <div class="form-group">
                            <label for="content">내용</label>
                            <textarea id="content" name="content" placeholder="내용을 입력하세요" rows="10" required>${vo.content }</textarea>
                        </div>

                        <div class="form-group">
                            <button type="submit">문의수정</button>
                        </div>
                    </form>
                </div>          
        </article>
    </main>
</body>
</html>