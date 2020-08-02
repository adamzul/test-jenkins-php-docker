node{
    checkout scm
    def myImage = docker.build("my-image")
    stage('delete container'){
        try{
            sh "docker container stop php-71-container"
            sh "docker container rm php-71-container"
        }catch(err){
            echo "delete error"
        }

    }
    
    sh 'docker run --restart always --name php-71-container -p 80:80 -v "$(pwd):/var/www/html:rw" -d my-image'
}