<form method="post" class="login-container">
        <h2>Đăng nhập</h2>
        <input name="UserName" placeholder="Tên đăng nhập" required>
        <input name="Password" type="password" placeholder="Mật khẩu" required>
        <button name="login">Đăng nhập</button>

        <div class="register-link">
            Bạn chưa có tài khoản? <a href="register.php">Đăng ký ngay</a>
        </div>

        <?php
        if (isset($_POST['login'])) {
            $username = $_POST['UserName'];
            $password = $_POST['Password'];

            $result = mysqli_query($conn, "SELECT * FROM Users WHERE UserName = '$username'");
            $user = mysqli_fetch_assoc($result);

            if ($user && password_verify($password, $user['Password'])) {
                $_SESSION['UserID'] = $user['UserID'];
                $_SESSION['RoleID'] = $user['RoleID'];
                $_SESSION['FullName'] = $user['FullName'];

                if ($user['RoleID'] == 1) {
                    header("Location: admin/index.php");
                } else {
                    header("Location: index.php");
                }
                exit();
            } else {
                echo "<div class='error-message'>Sai thông tin đăng nhập!</div>";
            }
        }
        ?>
    </form>
