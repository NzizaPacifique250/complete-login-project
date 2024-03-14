// Imports packages
const express = require("express");
const User = require("../modules/user");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");

// Variable initialization
const authRouter = express.Router();
authRouter.get("/", (req, res) => {
  res.send("Welcome to our first page");
}),
  authRouter.post("/signup", async (req, res) => {
    try {
      const { name, email, password } = req.body;
      const existingUser = await User.findOne({ email });
      if (existingUser) {
        return res.status(400).json({ msg: "This email has been used" });
      }
      const hashedPassword = await bcryptjs.hash(password, 8);

      let newUser = new User({ name, email, password: hashedPassword });

      newUser = await newUser.save();
      res.json(newUser);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

authRouter.post("/login", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ msg: "The user does not exist!" });
    }

    const passMatch = await bcryptjs.compare(password, user.password);

    if (!passMatch) {
      return res.status(400).json({ msg: "Invalid Password" });
    }
    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ msg: e.message });
  }
});

authRouter.post("/valid-token", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);

    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return res.json(false);

    const user = await User.findById(verified.id);
    if (!user) return res.json(false);
    return res.json(true);
  } catch (e) {
    res.status(500).json({ msg: e.message });
  }
});
// Get user data api

authRouter.get("/", auth, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});
module.exports = authRouter;
