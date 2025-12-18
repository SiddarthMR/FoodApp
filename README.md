# 🍔 FoodApp – Online Food Delivery Web Application

FoodApp is a Java-based food delivery web app built with JSP, Servlets, JDBC, and MySQL that lets users browse restaurants, manage carts, and place orders.

---

## 🚀 Features

* 🏪 Restaurant listing with open / close
* 🛒 Cart management (add / remove / update items)
* 📦 Order summary & checkout
* 🧾 Order history

---

## 🛠️ Tech Stack

* **Backend:** Java, JSP, Servlets, JDBC
* **Frontend:** HTML, CSS, JavaScript
* **Database:** MySQL
* **Server:** Apache Tomcat 9 / 10
* **Tools:** Eclipse IDE, Git & GitHub

---

## 📂 Project Structure

```text
FoodApp/
|── database/
│   ├── foodapp.sql
│── src/
│   └── com.food
│       ├── controller
│       ├── dao
|       ├── daoimpl
│       ├── model
│       └── DButil
│── WebContent/
│   ├── css/
│   ├── js/
│   ├── images/
│   ├── jsp/
│   
│       
│── .gitignore
│── README.md
```

---

## 🗄️ Database Setup (MySQL)

The database files are included under the `database/` folder.

### 📂 Database Files

```text
database/
 └── foodapp.sql   # Includes schema and sample data
```

### 🔹 Step 1: Create Database

```sql
CREATE DATABASE foodapp;
USE foodapp;
```

### 🔹 Step 2: Import Schema and Data

```bash
mysql -u root -p foodapp < database/foodapp.sql
```

> ⚠️ **Important:** Do NOT commit database usernames or passwords to GitHub.

---

## ▶️ How to Run the Project

1. Clone the repository:

```bash
git clone https://github.com/your-username/FoodApp.git
```

2. Open **Eclipse IDE**
3. Import the project as **Existing Dynamic Web Project**
4. Install and configure **Apache Tomcat 9 or 10**
5. Add the project to the Tomcat server
6. Start the server
7. Open in browser:

```text
http://localhost:8080/FoodApp/
```

---

## 🔐 Git & `.gitignore`

This project uses a `.gitignore` file to prevent committing:

* IDE-specific files (`.classpath`, `.project`, `.settings/`)
* Server files (`Servers/`, `work/`, `temp/`)
* Compiled and auto-generated files

Apache Tomcat is **not included** in this repository and must be installed locally.

---

## 📸 Images

Images can be added under:

```text
WebContent/images/
```

text WebContent/images/

```text
webapp/images/
```

---

## 🚧 Future Enhancements

* Online payment gateway integration
* Admin dashboard
* User authentication & roles
* Live order tracking

---

## 👨‍💻 Author

Siddarth M
📧 Email: [siddarthsiddu739@gmail.com](mailto:siddarthsiddu739@gmail.com)

---

⭐ If you like this project, don’t forget to **star** the repository!
