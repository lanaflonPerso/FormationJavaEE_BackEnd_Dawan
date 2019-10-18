<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<%!
long factoriel(int x) {
	long P = 1L;
	for(int i=1 ; i<=x ; i++) {
		P *= i; // �quivalent de P = P * i
	}
	return P;
}
%>

<h1>i18 1 (internationalisation)</h1>
<fmt:setLocale value="mg" />
    <p>En malgache : 
    	<fmt:bundle basename="i18n" >
        	<fmt:message key="bonjour" />
    	</fmt:bundle>
   </p>
   
<fmt:setLocale value="fr" />
    <p>En fran�ais : 
    	<fmt:bundle basename="i18n" >
        	<fmt:message key="bonjour" />
    	</fmt:bundle>
   </p>
   
   
<fmt:setLocale value="en" />
    <p>En anglais : 
    	<fmt:bundle basename="i18n" >
        	<fmt:message key="bonjour" />
    	</fmt:bundle>
   </p>
<hr />


<u>Formatage des dates</u><br /><br />
<fmt:setLocale value="fr_CA" />
<fmt:formatDate value="${date1}" pattern="E d MMMM yyyy" />
<br /><br />
<fmt:formatDate value="<%=new java.util.Date() %>" pattern="E d MMMM yyyy"/>
<br /><br />
DATESTYLE : FULL<br />
<fmt:formatDate dateStyle="full" value="${date}" />
<br /><br />
<fmt:formatDate value="<%=new java.util.Date() %>" dateStyle="full"  type="date" />
<br /><br />
HEURE<br />
<fmt:formatDate value="${date}" dateStyle="full"  type="time" /><!-- 17:49:42  -->
<br /><br />

<hr />
<h1>Les nombres</h1>
<p><fmt:formatNumber type="percent" value="0.55" /></p><!-- 55 % -->
<p><fmt:formatNumber type="number" value="0.55" /></p> <!-- 0,55 -->
<p><fmt:formatNumber type="currency" value="0.55" /></p> <!-- 0,55$ -->

<p>
En euro :
<p><fmt:formatNumber type="currency" value="75" currencySymbol="&euro;"/></p>
<!-- 75,00  -->

<c:set var="number" value="${string}"/>
	<p>
		Nombre � convertir : <c:out value="${number }" />
    <p>
    	Conversion en entier d'une cha�ne avec integerOnly � true : <br/>
    	<fmt:parseNumber  var="num" value="${number}" integerOnly="true" /> 
    	<c:out value="${num}"/>
    </p>
    <p>
    	Conversion en entier d'une cha�ne avec integerOnly � false : <br/>
    	<fmt:parseNumber  var="num" value="${number}" integerOnly="false"  /> 
		${num }
	</p>
	<p>
    	Conversion en entier d'une cha�ne avec integerOnly par d�faut : <br/>
    	<fmt:parseNumber  var="num" value="${number}" /> 
		<c:out value="${num}" />
	</p>
	
	<p>
    	Conversion en format mon�taire d'une cha�ne : <br/>
    	<fmt:parseNumber  var="num" value="${number}"  />
    	<fmt:formatNumber var="result" type="currency" value="${num }" /></p> 
		<c:out value="${result}" />
	</p>
	
	
	<p>
    	Conversion en format pourcentage d'une cha�ne : <br/>
    	<c:set value="${number}" var="number" />
    	<fmt:parseNumber  var="num" value="${number}"  />
    	<c:set var="inNumber" value="${num/1000000 }" />
    	<fmt:formatNumber var="result" type="percent" value="${inNumber }" /></p> 
		<c:out value="${result}" />
	</p>

 
</p>

<!-- Utilisation de la m�thode factoriel() que nous avons d�finie plus haut -->
10! = <%=factoriel(10) %>

<p>
<h1>Formulaire GET, Intro JavaScript, input hidden</h1>
<form method="GET" action="cours" >
	<input type="hidden" name="michel" value="calcul_factoriel" />
	<input id="un_nombre" type="number" name="nombre" onkeyup="analyser(this.value)" />
	<input id="bouton" type="submit" value="!" />
</form>
<c:if test="${not empty resultat }">
	${nb}! = ${resultat }
</c:if>



<script>
function analyser( valeur ){
	if( valeur > 35 ) {
		alert("Donnez un nombre inf�rieur ou �gal � 35 SVP");
		document.getElementById('un_nombre').value = "";
		document.getElementById('bouton').value = "!";
	} else {
		document.getElementById('bouton').value = document.getElementById('un_nombre').value + "!";
	}
}
</script>

</p>