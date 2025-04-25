class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? webLink;

  var link;

  var description;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.webLink,
  });
}

// ###############
// HOBBY PROJECTS
List<ProjectUtils> industrialProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/finacle erp.png',
    title: 'Employee managment System - Finakle',
    subtitle: '''
       Customized the employee dashboard and properties of the "Finakle" employee management system.
      
       Implemented enhancements to improve data accuracy, user experience, or system functionality.

        ''',
  ),
];

// ###############
// WORK PROJECTS
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
      image: 'assets/projects/rps.png',
      title: 'Rockpapersissor Game  - JS, DOCKER, NGINX alpaine',
      subtitle: '''
       Rock Paper Scissors game built with JavaScript and containerized using Docker with Nginx!
      🔹 Features:
            Clean, responsive UI
            Score tracking
            Fun animations
            Now easily deployable anywhere with Docker
          I learned so much about:
          ✅ Frontend JavaScript game logic,Docker containerization,Nginx web server configuration

        ''',
      webLink:
          'https://github.com/DasunBhagya/https---github.com-DasunBhagya-rps-game-dockerized-nginx'),
  ProjectUtils(
      image: 'assets/projects/02.png',
      title: 'Car Rental System - JAVA, DOCKER, MYSQL',
      subtitle: '''
        • Developed a car rental system enabling online vehicle booking, inventory management, and rental processing.<br>
        • Utilized Java for backend logic, MySQL for database management, and Docker for containerization.<br>
        • Implemented key features:<br>
          - User authentication & role-based access<br>
          - Vehicle search, booking, and payment processing
          - Admin dashboard for inventory management<br>
        • Deployed using Docker for scalability and easy deployment.
        ''',
      webLink: 'https://github.com/DasunBhagya/MechSysCarRental'),
  ProjectUtils(
      image: 'assets/projects/03.png',
      title: 'CaffainBooster 2.0|',
      subtitle: '''
        • Full-stack web application (Angular, Spring Boot, MySQL) for cafe management.Implemented secure user authentication
          (signup, login, password management). 
        • Developed Restful APIs for product, category, and bill management.Generated
          sales reports and created a dynamic dashboard.
        • Built user-friendly interfaces for order processing and bill viewing.Managed CRUD operations for core
          data entities.
        ''',
      webLink: 'https://github.com/DasunBhagya/CaffeineBooster2.0'),
  ProjectUtils(
    image: 'assets/projects/04.png',
    title: 'CHOPSTICK FOODS Restaurant Managment System - C Sharp ',
    subtitle: '''
        •Develop a comprehensive RMS that integrate various functionalities including order
        •management , inventory control, staff scheduling and customer relationship management.
        •Design an intuitive and user-friendly interface that simplifies the tasks for restaurant staff and reduces manual
         effort.
        ''',
    webLink:
        'https://github.com/DasunBhagya/Team-5-Restaurent-Managment-System',
  ),
];
