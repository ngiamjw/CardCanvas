# CardCanvas

**CardCanvas** is a dynamic flashcard app that allows you to combine drawing and text for a more interactive study experience. Whether you're learning complex diagrams or memorizing key facts, CardCanvas offers a flexible way to revise and test yourself with ease. You can also track your progress by recording past scores.

## Features

- **Draw & Write**: Create flashcards with both drawings and text to visualize and organize your notes.
- **Self-Testing**: Test yourself with a built-in self-testing mode to track your knowledge and monitor progress.
- **Score Tracking**: Keep a record of past test scores to gauge improvement over time.
- **Organized Folders**: Organize your flashcards into folders for efficient categorization and quick access.
- **Dark & Light Mode**: Toggle between dark and light themes to suit your preferences.
  
## Inspiration

I frequently use flashcards to prepare for exams, but many digital options only allow text inputs. I wanted a tool that could combine both drawing and text to make revising more effective. With **CardCanvas**, users can visualize complex topics through drawings while still benefiting from traditional text flashcards. Additionally, the app includes a testing feature with score tracking to help users monitor their progress.

## Tech Stack

- **Flutter**: Frontend framework for building the app.
- **Isar Database**: Local database for storing flashcards, folders, and user data.
- **Flutter Libraries**:
  - `flutter_slidable` – For swipeable functionality within the app.
  - `fl_chart` – For visualizing test scores and tracking progress.

## Challenges

During development, one of the biggest challenges was integrating drawing data into the Isar database. Isar supports only specific data types, so I had to convert some data within the `DrawingPoints` class to fit. Storing both drawing and text data together was another hurdle. Additionally, designing an intuitive and interactive user interface for both drawing and text inputs was complex but essential to creating a seamless user experience.

## How to Install

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/cardcanvas.git

