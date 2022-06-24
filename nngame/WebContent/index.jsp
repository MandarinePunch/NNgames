<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!Doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NNgame</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/style.css"/>
</head>
<body>
	<%@ include file="./tags/header.jsp"%>

	<!-- main -->
	<main>
	<div id="carouselExampleCaptions" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="./img/banner/main/bg1.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h1>Far Cry 6</h1>
					<p>현대식 게릴라 혁명의 비정한 세계에 뛰어들어 독재자와 그 아들로부터 국가를 해방하십시오.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="./img/banner/main/bg2.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h1>FINAL FANTASY VII REMAKE INTERGRADE</h1>
					<p>불후의 명작 『FINAL FANTASY VII』의 세계가 「새로운 이야기」로 다시 태어난다.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="./img/banner/main/bg3.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h1>SIFU 시푸</h1>
					<p>자신의 가족을 살해한 자들을 쫒아 복수의 길에 들어선 쿵푸 수련생이 되시겠습니까?</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<section id="games-box">
		<div id="games">
			<div class="main-icon">
				<a href="#">
					<div>
						<img src="./img/icon/main/discount.png" />
					</div>
					<p>할인게임</p>
				</a>
			</div>
			<div class="main-icon">
				<a href="#">
					<div>
						<img src="./img/icon/main/popular.png" />
					</div>
					<p>인기게임</p>
				</a>
			</div>
			<div class="main-icon">
				<a href="#">
					<div>
						<img src="./img/icon/main/recommend.png" />
					</div>
					<p>추천게임</p>
				</a>
			</div>
		</div>
	</section>
	</main>
	
	<%@ include file="./tags/footer.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>