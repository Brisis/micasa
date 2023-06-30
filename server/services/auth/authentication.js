import {poolConnection} from "../../database/connection.js"

import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";

async function checkEmailUse(email) {
  //check if email in use
  const [emailCheck] = await poolConnection.query(
      `
        SELECT * FROM users 
        WHERE LOWER(email) = LOWER(?);
      `, [email]
  );

  return emailCheck;
}

export async function registerUser(name, email, password){

  const emailCheck = await checkEmailUse(email)

  if (emailCheck.length < 1) {
    try {
      //register user
      const hash = await bcrypt.hash(password, 10);

      const [user] = await poolConnection.query(
        `
          INSERT INTO users (name, email, password) 
          VALUES (?, ?, ?)
        `, [name, email, hash]
      );
  
      return {
        id: user.insertId,
        name: name,
        email: email,
        password: hash
      }; 

    } catch (error) {
      return error;
    }
  } 
  else {
    return "Email Address Already In Use!";
  }
}

export async function loginUser(email, password){

  const emailCheck = await checkEmailUse(email)

  if (emailCheck.length >= 1) {
    const user = emailCheck[0];

    try {
      //login user
      const result = await bcrypt.compare(password, user.password);

      if (result) {

        var token = jwt.sign(
          { id: user.id },
          "the-super-strong-secrect",
          { expiresIn: "7d" }
        );

        const [queryDB] = await poolConnection.query(
          `
            UPDATE users 
            SET last_login = now() 
            WHERE id = '?'
          `, [user.id]
        );
  
        return {
          msg: "Logged in!",
          token: token,
          user: user,
        };
      }
      else {
        //wrong password
        return "Email or password is incorrect!";
      }
    }
    catch (error) {
      return error;
    }
  }

  return "User not Found!"
}

export async function getUser(authorization){

  const theToken = authorization.split(" ")[1];
  const decoded = jwt.verify(theToken, "the-super-strong-secrect");

  try {
    const [user] = await poolConnection.query(
      `
        SELECT * FROM users WHERE id=?
      `,
      [decoded.id]
    );
  
    return {
      user: user,
      message: "Fetch Successfully."
    };
  } catch (error) {
    return error;
  }
}



// router.post("/get-user", signupValidation, (req, res, next) => {
//   if (
//     !req.headers.authorization ||
//     !req.headers.authorization.startsWith("Bearer") ||
//     !req.headers.authorization.split(" ")[1]
//   ) {
//     return res.status(422).json({
//       message: "Please provide the token",
//     });
//   }
//   const theToken = req.headers.authorization.split(" ")[1];
//   const decoded = jwt.verify(theToken, "the-super-strong-secrect");
//   db.query(
//     "SELECT * FROM users where id=?",
//     decoded.id,
//     function (error, results, fields) {
//       if (error) throw error;
//       return res.send({
//         error: false,
//         data: results[0],
//         message: "Fetch Successfully.",
//       });
//     }
//   );
// });

