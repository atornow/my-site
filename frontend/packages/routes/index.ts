// Define route paths
export const HOME_PATH = '/';
export const ABOUT_PATH = '/about';
export const BLOG_PATH = '/blog';
export const BLOG_POST_PATH = '/blog/:id';

// Route helper functions
export const homePath = () => HOME_PATH;
export const aboutPath = () => ABOUT_PATH;
export const blogPath = () => BLOG_PATH;
export const blogPostPath = (id: string) => `/blog/${id}`;