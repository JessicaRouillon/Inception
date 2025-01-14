## Inception

### 🗺️ Project Description

The `inception` project is an essential step in building a multi-container Dockerized environment. It involves a robust infrastructure for the application using Docker Compose to manage and orchestrate several containers.
This project helps understand the basics of containerization and networking while focusing on automation, security and scalability.

### 🌟 Key Features

- Multi-container environment setup using Docker Compose.
- Includes containers for Nginx, MariaDB, WordPress.
- Custom network configuration for secure inter-container communication.
- Automated setup with Dockerfiles for each service.
- Persistent database storage for WordPress.
- PHP support for web applications with Nginx.
- Easy-to-use .env file for configuring environment variables.

### 🚀 Usage

#### 1. Create a Virtual Machine (VM)

As the project was executed at school, many rights (i.e. sudo) were not given.
If you also encounter such constraints, it is advise to create a Virtual Machine for this project.

#### 2. Clone the repository in the VM

```shell
git clone https://github.com/JessicaRouillon/Inception.git
```

#### 3. Compile the `inception` program

```shell
make
```

#### ⚠️ Warning

The `.env` file has been left in this repository for example purposes.
In real projects, **DO NOT** leave your `.env` in your repositories as it contains sensitive information (i.e. passwords).
