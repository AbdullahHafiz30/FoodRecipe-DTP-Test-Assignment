# 🍽️ FoodRecipe – SwiftUI Sample App

A sleek, SwiftUI‑based recipe browser that lets users **search** thousands of meals, **infinitely scroll** through results, and dive into rich **detail pages**—all powered by the Food2Fork API.

---

## ✨ Features

| Feature                | Details                                                                                          |
| ---------------------- | ------------------------------------------------------------------------------------------------ |
| 🔍 Instant Search      | Search bar in the navigation drawer; submits on *Return* and updates results live.               |
| 🔄 Infinite Scroll     | `LazyVGrid` with adaptive columns and async pagination (`Task { await vm.loadMoreIfNeeded() }`). |
| 📲 Pull‑to‑Refresh     | Native `refreshable {}` reloads current query.                                                   |
| 🌗 Dark‑ & Light‑Mode  | SF Symbols + color‑aware icons for a perfect look in either theme.                               |
| 📋 Ingredient List     | Scrollable detail view showing image, publisher, ingredients, and a source link.                 |
| 🏗️ MVVM + async/await | Clean separation with `HomeViewModel` and `DetailsViewModel`, 100% Swift Concurrency.            |
| 🖼️ Remote Images      | Blazing‑fast caching via **SDWebImageSwiftUI** placeholders + progressive loading.               |

---

## 📸 Screenshots

| Home Grid                           | Search Results                    | Recipe Detail                     |
| ----------------------------------- | --------------------------------- | --------------------------------- |
| <img src="https://github.com/user-attachments/assets/a2b76827-9678-4e23-a13e-1e6b714e18c4" width="196" height="426"> | <img src="https://github.com/user-attachments/assets/8d59bed8-c3cd-4329-a3b9-0c10d61d842d" width="196" height="426"> | <img src="https://github.com/user-attachments/assets/59392b1b-2db1-42c7-bfb0-b94562c51268" width="196" height="426"> |

---

## 🎬 Demo Video

[▶️ Watch the Demo](https://drive.google.com/file/d/1AZhDlbc6vtKn0MT6jTYVQ5lcnS9S1WVC/view?usp=sharing)

---

## 🚀 Getting Started

### Prerequisites

* Xcode 15 or newer
* iOS 17 simulator or device
* A free **Food2Fork** API key – grab one at [https://food2fork.ca](https://food2fork.ca).

### Setup Steps

1. **Clone** the repo

```
FoodRecipe
├── Home
│   ├── HomeView\.swift        # grid & search UI
│   ├── HomeViewModel.swift   # search + pagination logic
│   └── RecipeCardView\.swift  # grid cell card
├── Details
│   ├── RecipeDetailView\.swift# detail UI
│   └── DetailsViewModel.swift# fetch recipe by id
├── Models
│   ├── Recipe.swift          # single recipe model
│   └── RecipePage.swift      # paginated response model
└── Utils
└── PlistReader.swift     # safe Info.plist value lookup
```
---

## 📦 Dependencies

* **[SDWebImageSwiftUI](https://github.com/SDWebImage/SDWebImageSwiftUI)** – async image loading & caching.

All dependencies are added via **Swift Package Manager** (no CocoaPods/Carthage needed).

---

## 🌐 API Endpoints Used

| Purpose | Endpoint                               |
| ------- | -------------------------------------- |
| Search  | `GET /api/recipe/search/?query={text}` |
| Detail  | `GET /api/recipe/get/?id={id}`         |

---

## 🙌 Credits

* Meal data provided by **Food2Fork.ca**.
* Built with ❤️ by **Abdullah M. Hafiz**.

---

## 📝 License

This project is released with **no formal license**. You’re welcome to use, modify, and share it freely.

