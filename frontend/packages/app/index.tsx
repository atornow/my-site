import React from 'react';
import { createRoot } from 'react-dom/client';
import './styles.css';
import Root from './root';

const container = document.getElementById('root');
const root = createRoot(container!);
root.render(<Root />);