const card = document.getElementById('business-card');
const portrait = document.getElementById('portrait');
const wrapper = document.getElementById('description-wrapper');
const headerLinks = document.getElementById('header-links');
const innerHeaderLinks = document.getElementById('header-links-inner');
const dummyCell = document.getElementById('dummy-table-element');
const title = document.getElementById('title');

let cardHeight = card.clientHeight;
let topOffset = card.offsetTop - cardHeight / 2;
let wrapperHeight = wrapper.clientHeight;
window.addEventListener('resize', function() {
    cardHeight = card.clientHeight;
    topOffset = card.offsetTop - cardHeight / 2;
    wrapperHeight = wrapper.clientHeight;
    onUserScrolled();
});

window.addEventListener('scroll', function() {
    onUserScrolled();
});
const STATE_CARD = 'business-card';
const STATE_HEADER = 'header';
let previousState = STATE_CARD;

// TODO: Not actually called iterate but I forgot the right term.
function iterate(start, end, p) {
    return start + (end - start) * p;
}


function onUserScrolled() {
    const scrollPosition = window.pageYOffset || document.documentElement.scrollTop;
    const start = topOffset;
    const end = (window.innerHeight + start) / 2;
    const mid = (end + start) / 2;
    function calcPercent(start, end) {
        let perc = (scrollPosition - start) / (end - start);
        if (perc < 0) perc = 0;
        if (perc > 1) perc = 1;
        return perc;
    }

    let firstHalf = calcPercent(start, mid);
    let secondHalf = calcPercent(mid, end);
    // Only the second half of the top half scroll counts from 0 -> 1 percent
    const cardTop = card.getBoundingClientRect().top;
    portrait.style.width = iterate(220, 48, firstHalf) + 'px';
    portrait.style.height = iterate(220, 48, firstHalf) + 'px';
    title.style['font-size'] = iterate(48, 40, firstHalf) + 'px';
    card.style['border-radius'] = iterate(5, 0, firstHalf) + 'px';
    card.style.width = iterate(700, document.body.scrollWidth, firstHalf) + 'px';
    wrapper.style.height = iterate(wrapperHeight, 0, firstHalf) + 'px';
    dummyCell.style.width = iterate(0, 400, firstHalf) + 'px';
    headerLinks.style.transform = 'translate(' + iterate(100, 0, secondHalf) + '%, 0%)';
    if (scrollPosition > mid) {
        headerLinks.style.display = 'table-cell';
        dummyCell.style.display = 'none';
    } else {
        headerLinks.style.display = 'none';
        dummyCell.style.display = 'table-cell';
    }
    if (scrollPosition < start) {
        card.style.top = '';
        card.style.left = '';
        card.style.position = '';
        card.style.transform = 'translate(-50%, -50%)';
        previousState = STATE_CARD;
    } else {
        card.style.top = '0px';
        card.style.left = '50%';
        card.style.position = 'fixed';
        card.style.transform = 'translate(-50%, 0%)';
        previousState = STATE_HEADER;
    }

    determineAnchorActive(scrollPosition);
}

const anchorLinks = Array.from(document.querySelectorAll('a.header-link'));
const anchors = Array.from(document.querySelectorAll('a.anchor')).slice(0, anchorLinks.length);
let activeIndex = 0;

function determineAnchorActive(scrollPosition) {
    const newIndex = anchors.findIndex(function(element) {
        const rect = element.getBoundingClientRect();
        return (rect.top > - 200 - window.innerHeight / 2);
    });
    if (newIndex > -1) {
        anchorLinks[activeIndex].classList.remove('active');
        anchorLinks[newIndex].classList.add('active');
        activeIndex = newIndex;
    }
}
