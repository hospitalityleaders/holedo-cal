# Holedo Calendar standard contract

Canonical destination: https://github.com/hospitalityleaders/holedo-standards

Required versions: **Holedo Admin Standard 1.0** and **Holedo UI Tokens 1.0**, including public shell and legal presentation 1.0.

Pinned canonical commit: `57d9bfdbec240e3eb2d62e5cbba324709c791136` ([immutable foundation](https://github.com/hospitalityleaders/holedo-standards/tree/57d9bfdbec240e3eb2d62e5cbba324709c791136)). Adoption status: **not conformant — implementation and evidence pending**. Do not claim 1.0 conformance against an unpinned moving branch. The publication SHA above is the immutable 1.0 reference.

Before changing Calendar UI, public pages, navigation, admin, authentication presentation or runtime settings, read this contract and the pinned canonical `admin/ADMIN_STANDARD.md`, `admin/ADMIN_SETTINGS.md`, `ui/TOKENS.md`, `ui/UI_STANDARD.md`, `product/LEGAL_STANDARD.md`, `product/EMBEDDED_APP_STANDARD.md` and `admin/CONFORMANCE.md`. Copy tokens into Calendar's own build; retain its own database, settings, secrets and deployment. Never load the standards repository at runtime.

Common `/admin` settings must use the canonical shell and seven sections in order: Navigation; Colours; Branding, SEO and sharing; Homepage; Access and account buttons; Legal; Code injection. Existing Calendar operations follow under `Product administration`. Preserve native URLs as aliases or operational routes, with existing authorization. Avoid duplicate storage of common concepts.

## Product-specific functionality to preserve

Inspected baseline: `0e54eb697dbb8870c28d8f6d6480da993235a8bb`.

- Authentication: registration, password, Google, GitHub and generic OAuth switches; signup/booking reCAPTCHA switches and thresholds.
- Email: admin alerts/address, email brand name/accent and logo upload/removal.
- General: meeting payments, booking analytics and admin/booking default locales.
- Users: inventory/counts and promote/demote actions with existing safeguards.
- Runtime override precedence and reset behavior in `Tymeslot.AppSettings`.
- Scheduling, calendar/video integrations and booking themes elsewhere in the application. Do not invent common fields or remove these features to fit the Holedo form.

Current routes: `/admin`, `/admin/settings`, `/admin/authentication`, `/admin/email`, `/admin/general`, `/admin/users`. Common settings should become the `/admin` landing view; preserve native tabs/bookmarks through an explicit tested routing plan. Booking theme customization remains separate from installation/public/admin theme preferences. Product actions may retain their native save flows below the common atomic `Save settings` form.

## Standalone and embedded entry points

The approved Calendar hostname must expose a standalone root with the Holedo global menu bar and `/app` without that bar for React and Flutter WebViews. The exact hostname remains to be confirmed; this contract does not configure DNS. Both presentations use the same Calendar release, data, authentication and permissions. Keep native scheduling navigation, calendar controls and booking customization.

Implement `/app` and `/app/` consistently, document embedded deep links and preserve embedded mode through navigation, reload, errors and product-owned authentication returns. No host-side CSS or script should be required to remove the bar. Preserve safe same-product return paths and current security gates. Document retained legal/theme access and verify the real React/Flutter WebView login flows on target devices. Browser iframe support, if needed, requires separately reviewed exact framing origins; it is not implied by native WebView support.

Current embedded route conformance is not verified. Implement and test the canonical `product/EMBEDDED_APP_STANDARD.md` without removing native controls.

## Security integration gap

Current access uses authenticated users and admin roles through `RequireAdminUiEnabled`, `RequireAdmin` and `EnsureAdminHook`, plus bootstrap and promote/demote tooling. No `ADMIN_TOKEN` / `ADMIN_SESSION_SECRET` integration was found. `SECRET_KEY_BASE` remains the Phoenix secret; neither admin secret replaces it.

Define a token-based common-settings session gate preserving native role and self-hosted/SaaS checks, or obtain approval for a specific role-based exception. A token session must not automatically authorize user management. Keep current gates active throughout migration; test HTTP/LiveView authorization, CSRF, logout, rotation and bootstrap recovery. Secrets are deployment configuration, never DB runtime fields or committed values.

## Approved exceptions

None. Gaps are not exceptions. Each proposed exception needs requirement, scope, reason, owner, approval reference, review date and migration plan. Document adapters for existing storage names rather than renaming DB fields without migration.

See [baseline and acceptance evidence](HOLEDO_CONFORMANCE.md), [release gate](DEPLOYMENT.md) and [native admin access](ADMIN.md). This documentation does not implement conformance, alter operational functionality, deploy production or authorize infrastructure changes.
