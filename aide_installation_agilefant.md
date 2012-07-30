// Les informations suivantes sont fournies à titre indicatif, c'est avec cette configuration que j'ai pu compiler et deployer AgileFant
// Des informations complémentaire sont disponible sur http://www.agilefant.org/wiki/display/AEF/Installation+guide#Installationguide-Downloadthelatestrelease notamment pour l'installation MySQL

OS
	- version Windows XP SP3

Eclipse 
	- version Juno
	- Java version JDK 1.7

Ant
	- ajout dans Classpath de tools.jar du JDK1.7 suite à problème sur build.xml com.sun.tools.jxc.SchemaGenTask ne trouvait pas la classe "com/sun/mirror/apt/AnnotationProcessorFactory"
	- forcer la compilation en java 1.6 en ajoutant les attributs suivants :
		 fork="yes" source="1.6" target="1.6"
	  dans la balise <javac> de la balise mère <target name="compile" depends="init" description="Compiles source files">

JAVA_HOME
	- Java version JDK 1.7

Tomcat
	- version 6.0

MySQL
	- version 5.5
	- suivre les instructions pour la création du user et base sur http://www.agilefant.org/wiki/display/AEF/Installation+guide#Installationguide-Downloadthelatestrelease

