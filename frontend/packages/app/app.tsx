import React from 'react';
import { Routes, Route } from 'react-router-dom';
import { HOME_PATH, ABOUT_PATH, BLOG_PATH, BLOG_POST_PATH } from '@/routes';

// Placeholder components - will be replaced with actual components later
const Home = () => <div>Home Page</div>;
const About = () => <div>About Page</div>;
const Blog = () => <div>Blog Page</div>;
const BlogPost = () => <div>Blog Post Page</div>;

const App: React.FC = () => {
  return (
    <div className="min-h-screen bg-gray-100">
      <header className="bg-white shadow">
        <div className="max-w-7xl mx-auto py-6 px-4">
          <h1 className="text-3xl font-bold text-gray-900">My Site</h1>
        </div>
      </header>
      <main>
        <div className="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
          <Routes>
            <Route path={HOME_PATH} element={<Home />} />
            <Route path={ABOUT_PATH} element={<About />} />
            <Route path={BLOG_PATH} element={<Blog />} />
            <Route path={BLOG_POST_PATH} element={<BlogPost />} />
          </Routes>
        </div>
      </main>
    </div>
  );
};

export default App;