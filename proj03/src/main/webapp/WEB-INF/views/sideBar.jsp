<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Charlie MES</title>
    <style>
        /* 메인/서브 컬러 적용 */
        :root {
            --m-cl: #2D6A4F; 
            --s-cl: #49A47A; 
            --p-cl: #B7E4C7; 
            --bg: #F8F9FA;
            --txt: #333;
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
            font-family: 'Malgun Gothic', sans-serif;
            color: var(--txt);
            background-color: var(--bg);
        }

        /* 푸터 하단 고정용 */
        .mat-all {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* 헤더 */
        .hdr {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: var(--m-cl); 
            color: #FFF;
            padding: 0 2vw;
            height: 60px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        /* 로고 이미지 영역 (배경 이미지 처리) */
        .hdr-logo { 
            display: block;
            width: 12rem;      /* 로고 너비 */
            height: 2.5rem;    /* 로고 높이 */
            background-image: url('여기에_로고_경로_입력.png'); /* 이미지 경로 */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            text-indent: -9999px; /* 텍스트 숨김 (접근성 유지) */
            overflow: hidden;
        }

        .hdr-user { font-size: 0.9rem; }
        .hdr-user a { color: var(--p-cl); text-decoration: none; margin-left: 10px; }

        /* 메인 랩퍼 */
        .wrap { display: flex; flex: 1; }

        /* 사이드바 */
        .side {
            width: 15vw;
            min-width: 220px;
            background-color: #FFF;
            border-right: 1px solid #DDD;
        }

        .nav-list { list-style: none; }
        .nav-item { border-bottom: 1px solid #EEE; }

        /* 대메뉴 */
        .nav-btn {
            display: block;
            padding: 1rem 1.5rem;
            cursor: pointer;
            font-weight: bold;
            color: var(--m-cl);
            transition: background 0.3s;
        }

        .nav-btn:hover { background-color: var(--p-cl); }

        /* 소메뉴 */
        .sub-nav {
            list-style: none;
            display: none; 
            background-color: #F9FDFB;
        }

        .sub-nav.on { display: block; }

        .sub-nav a {
            display: block;
            padding: 0.7rem 1.5rem 0.7rem 2.5rem;
            font-size: 0.9rem;
            color: #555;
            text-decoration: none;
        }

        /* a태그 밑줄 및 간격 */
        .sub-nav a:hover {
            color: var(--m-cl);
            font-weight: bold;
            text-decoration: underline;
            text-underline-offset: 5px; 
        }

        /* 컨텐츠 영역 (비워둠) */
        .cont {
            flex: 1;
            padding: 2rem;
            background-color: #FFF;
        }

        /* 푸터 */
        .ftr {
            text-align: center;
            padding: 1rem 0;
            background-color: #EEE;
            font-size: 0.8rem;
            color: #777;
            margin-top: auto;
        }

        /* 반응형 처리 */
        @media (max-width: 768px) {
            .side { width: 60px; min-width: 60px; }
            .nav-btn span { display: none; }
            .sub-nav { position: absolute; left: 60px; width: 180px; box-shadow: 2px 2px 5px rgba(0,0,0,0.1); }
            /* 모바일 로고 크기 조절 */
            .hdr-logo { width: 8rem; }
        }
    </style>
</head>
<body>

<div class="mat-all">
    <header class="hdr">
        <a href="/pro3/main" class="hdr-logo">CHARLIE MES LOGO</a>
        
        <div class="hdr-user">
            <strong>000님</strong> 환영합니다 | <a href="#">로그아웃</a>
        </div>
    </header>

    <div class="wrap">
        <aside class="side">
            <ul class="nav-list">
                <li class="nav-item">
                    <a class="nav-btn toggle-btn">기준 관리</a>
                    <ul class="sub-nav">
                        <li><a href="/pro3/commonCode">공통 코드 관리</a></li>
                        <li><a href="/pro3/material">자재 관리</a></li>
                        <li><a href="/pro3/bom">BOM 관리</a></li>
                        <li><a href="/pro3/process">공정 관리</a></li>
                        <li><a href="/pro3/facility">설비 관리</a></li>
                        <li><a href="/pro3/account">거래처 관리</a></li>
                        <li><a href="/pro3/userAuth">사용자/권한 관리</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a href="#" class="nav-btn">생산 관리</a></li>
                <li class="nav-item"><a href="#" class="nav-btn">품질 관리</a></li>
                <li class="nav-item"><a href="#" class="nav-btn">창고 관리</a></li>
                <li class="nav-item"><a href="#" class="nav-btn">이력 및 추적 관리</a></li>
                <li class="nav-item"><a href="#" class="nav-btn">게시판</a></li>
                <li class="nav-item"><a href="#" class="nav-btn">리포트</a></li>
            </ul>
        </aside>

        <main class="cont">
            </main>
    </div>

    <footer class="ftr">
        <p>Copyright &copy; 2026 Charlie MES System. All Rights Reserved.</p>
    </footer>
</div>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        // 사이드바 토글 로직
        const toggles = document.querySelectorAll('.toggle-btn');
        
        toggles.forEach(btn => {
            btn.addEventListener('click', () => {
                const subNav = btn.nextElementSibling;
                if (subNav && subNav.classList.contains('sub-nav')) {
                    subNav.classList.toggle('on');
                }
            });
        });
    });
</script>
</body>
</html>