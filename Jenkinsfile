node{
    checkout scm
    def myImage = docker.build("my-image")
    sh 'docker container stop php-71-container'
    sh 'docker container rm php-71-container'
    sh "docker run --name php-71-container -p 80:80 -v '%cd%:/var/www/html:rw' -d my-image"
}