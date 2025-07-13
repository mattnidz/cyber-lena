const express = require('express');
const path = require('path');
const lessons = require('./data/lessons.json');
const quizzes = require('./data/quizzes.json');

const app = express();
app.set('view engine', 'ejs');
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));

app.get('/', (req, res) => {
  res.render('index', { lessons });
});

app.get('/lesson/:id', (req, res) => {
  const lesson = lessons.find(l => l.id === req.params.id);
  if (!lesson) return res.status(404).send('Lesson not found');
  res.render('lesson', { lesson });
});

app.get('/quiz/:id', (req, res) => {
  const quiz = quizzes.find(q => q.id === req.params.id);
  if (!quiz) return res.status(404).send('Quiz not found');
  res.render('quiz', { quiz });
});

app.post('/quiz/:id', (req, res) => {
  const quiz = quizzes.find(q => q.id === req.params.id);
  const answers = req.body;
  let score = 0;

  quiz.questions.forEach((q, i) => {
    if (answers[`q${i}`] === q.answer) {
      score++;
    }
  });

  res.render('result', { score, total: quiz.questions.length });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`CloudSec Learn running on http://localhost:${PORT}`));