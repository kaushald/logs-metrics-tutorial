import http from 'k6/http';
import { sleep } from 'k6';
export const options = {
    vus: 20,
    duration: '600s',
};
export default function () {
    const res = http.get('http://localhost:8080/process-order/');
}
