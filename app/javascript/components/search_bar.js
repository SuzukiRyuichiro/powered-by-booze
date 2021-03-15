import Typed from 'typed.js';

const loadDynamicSearchbar = () => {
  new Typed('#search-typed-text', {
    strings: ["Search by name", "Search by ingredients", "Search by recipe"],
    smartBackspace: true,
    backDelay: 700,
    backSpeed: 100,
    typeSpeed: 100,
    loop: true,
    attr: 'placeholder'
  });
}

export { loadDynamicSearchbar };
